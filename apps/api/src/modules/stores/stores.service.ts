import Decimal from "decimal.js";
import { prisma } from "../../db/prisma";
import { AppError } from "../../middleware/error.middleware";
import type { ListStoresQuery } from "./stores.schema";

type OpeningHours = Record<string, string>;

function haversineKm(
  lat1: number,
  lng1: number,
  lat2: number,
  lng2: number,
): number {
  const toRad = (value: number) => (value * Math.PI) / 180;
  const dLat = toRad(lat2 - lat1);
  const dLng = toRad(lng2 - lng1);
  const a =
    Math.sin(dLat / 2) ** 2 +
    Math.cos(toRad(lat1)) *
      Math.cos(toRad(lat2)) *
      Math.sin(dLng / 2) ** 2;

  return 6371 * 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
}

function isOpenNow(openingHours: OpeningHours, now = new Date()): boolean {
  const dayKeys = ["sun", "mon", "tue", "wed", "thu", "fri", "sat"] as const;
  const key = dayKeys[now.getDay()] ?? "mon";
  const hours = openingHours[key];
  if (!hours || hours === "closed") {
    return false;
  }

  const [open, close] = hours.split("-");
  if (!open || !close) {
    return false;
  }

  const [openHour, openMinute] = open.split(":").map(Number);
  const [closeHour, closeMinute] = close.split(":").map(Number);
  const minutesNow = now.getHours() * 60 + now.getMinutes();
  const openMinutes = openHour! * 60 + openMinute!;
  const closeMinutes = closeHour! * 60 + closeMinute!;

  return minutesNow >= openMinutes && minutesNow <= closeMinutes;
}

function mapStore(
  store: {
    id: string;
    name: string;
    address: string;
    city: string;
    state: string;
    pincode: string;
    phone: string;
    latitude: Decimal;
    longitude: Decimal;
    openingHours: unknown;
    isActive: boolean;
  },
  origin?: { lat: number; lng: number },
) {
  const openingHours = store.openingHours as OpeningHours;

  return {
    id: store.id,
    name: store.name,
    address: store.address,
    city: store.city,
    state: store.state,
    pincode: store.pincode,
    phone: store.phone,
    latitude: Number(store.latitude),
    longitude: Number(store.longitude),
    opening_hours: openingHours,
    is_open_now: isOpenNow(openingHours),
    distance_km:
      origin != null
        ? Number(
            haversineKm(
              origin.lat,
              origin.lng,
              Number(store.latitude),
              Number(store.longitude),
            ).toFixed(1),
          )
        : undefined,
  };
}

export class StoresService {
  async list(query: ListStoresQuery) {
    const stores = await prisma.storeLocation.findMany({
      where: {
        isActive: true,
        ...(query.q
          ? {
              OR: [
                { city: { contains: query.q, mode: "insensitive" } },
                { name: { contains: query.q, mode: "insensitive" } },
                { pincode: query.q },
              ],
            }
          : {}),
      },
    });

    const origin =
      query.lat != null && query.lng != null
        ? { lat: query.lat, lng: query.lng }
        : undefined;

    let mapped = stores.map((store) => mapStore(store, origin));

    if (query.radius_km != null && origin) {
      mapped = mapped.filter(
        (store) =>
          store.distance_km != null && store.distance_km <= query.radius_km!,
      );
    }

    if (origin) {
      mapped.sort(
        (a, b) => (a.distance_km ?? Infinity) - (b.distance_km ?? Infinity),
      );
    } else {
      mapped.sort((a, b) => a.city.localeCompare(b.city));
    }

    return { stores: mapped };
  }

  async getById(storeId: string) {
    const store = await prisma.storeLocation.findFirst({
      where: { id: storeId, isActive: true },
    });

    if (!store) {
      throw new AppError(404, "NOT_FOUND", "Store does not exist");
    }

    return { store: mapStore(store) };
  }
}

export const storesService = new StoresService();
