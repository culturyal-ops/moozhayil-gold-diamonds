import { randomUUID } from "crypto";
import { getMediaObjectStorage } from "../storage";

export interface StoredMediaFile {
  fileName: string;
  s3Key: string;
  publicUrl: string;
}

export async function storeAdminMedia(
  buffer: Buffer,
  mimeType: string,
  folder: "banners" | "products" = "products",
): Promise<StoredMediaFile> {
  const extension = mimeType.includes("png") ? "png" : "jpg";
  const key = `media/${folder}/${randomUUID()}.${extension}`;
  const storage = getMediaObjectStorage();
  const stored = await storage.putObject({
    key,
    body: buffer,
    contentType: mimeType,
  });

  return {
    fileName: `${folder}/${key.split("/").pop()}`,
    s3Key: stored.key,
    publicUrl: stored.publicUrl,
  };
}
