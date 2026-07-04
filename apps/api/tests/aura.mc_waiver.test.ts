import {
  calculateAuraMcWaiver,
  calculateProductPriceWithAuraMcWaiver,
} from "../src/modules/goals/aura.mc_waiver.service";
import { calculateProductPrice } from "../src/modules/products/price";

describe("Aura making-charge waiver", () => {
  const baseInput = {
    weightGrams: "10.0000",
    ratePerGramPaise: 624000,
    wastagePct: "0.00",
    stoneValuePaise: 0,
    gstPct: "3.00",
    rateUpdatedAt: new Date("2026-06-26T04:30:00Z"),
    generatedAt: new Date("2026-06-26T04:30:00Z"),
  };

  it("waives full making charge when product MC is at or below 20%", () => {
    const price = calculateProductPrice({
      ...baseInput,
      makingChargePct: "12.00",
    });

    const waiver = calculateAuraMcWaiver({
      goldValuePaise: price.gold_value_paise,
      makingChargePct: "12.00",
      makingChargePaise: price.making_charge_paise,
    });

    expect(waiver.waiver_pct_of_gold).toBe(12);
    expect(waiver.waived_making_paise).toBe(price.making_charge_paise);
    expect(waiver.payable_making_paise).toBe(0);
  });

  it("waives full making charge when product MC is within Golden Wish 0% benefit", () => {
    const price = calculateProductPrice({
      ...baseInput,
      makingChargePct: "25.00",
    });

    const waiver = calculateAuraMcWaiver({
      goldValuePaise: price.gold_value_paise,
      makingChargePct: "25.00",
      makingChargePaise: price.making_charge_paise,
    });

    expect(waiver.waiver_pct_of_gold).toBe(25);
    expect(waiver.waived_making_paise).toBe(price.making_charge_paise);
    expect(waiver.payable_making_paise).toBe(0);
  });

  it("recalculates product total with GST after waiver", () => {
    const waivedPrice = calculateProductPriceWithAuraMcWaiver({
      ...baseInput,
      makingChargePct: "12.00",
    });

    expect(waivedPrice.mc_waiver_applied).toBe(true);
    expect(waivedPrice.making_charge_paise).toBe(0);
    expect(waivedPrice.total_paise).toBeLessThan(
      calculateProductPrice({ ...baseInput, makingChargePct: "12.00" }).total_paise,
    );
  });
});
