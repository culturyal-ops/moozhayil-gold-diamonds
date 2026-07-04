import { calculateProductPrice } from "../src/modules/products/price";
import { formatGoldGrams } from "../src/utils/gold";
import { formatPaise } from "../src/utils/money";

describe("Phase 4 money and gold utilities", () => {
  it("formats paise using Indian numbering", () => {
    expect(formatPaise(8496600)).toBe("₹84,966");
    expect(formatPaise(236000)).toBe("₹2,360");
  });

  it("floors gold display to one decimal place", () => {
    expect(formatGoldGrams("37.4892")).toBe("37.4g");
    expect(formatGoldGrams("10.0000")).toBe("10.0g");
  });

  it("calculates product price with Decimal.js and rounded paise components", () => {
    const price = calculateProductPrice({
      weightGrams: "13.6000",
      ratePerGramPaise: 624000,
      makingChargePct: "12.00",
      wastagePct: "0.00",
      stoneValuePaise: 0,
      gstPct: "3.00",
      rateUpdatedAt: new Date("2026-06-26T04:30:00Z"),
      generatedAt: new Date("2026-06-26T04:30:00Z"),
    });

    expect(price.gold_value_paise).toBe(8486400);
    expect(price.making_charge_paise).toBe(1018368);
    expect(price.gst_paise).toBe(285143);
    expect(price.total_paise).toBe(9789911);
    expect(price.rate_display).toBe("₹6,240/g");
    expect(price.price_valid_until).toBe("2026-06-26T04:45:00.000Z");
  });
});
