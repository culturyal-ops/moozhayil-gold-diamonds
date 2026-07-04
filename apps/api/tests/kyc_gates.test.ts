import {
  checkCheckoutGate,
  checkContributionGate,
  checkGoalCreationGate,
  checkRedemptionGate,
} from "../src/utils/kyc_gates";

describe("KYC gate rules", () => {
  it("requires basic KYC for scheme enrollment", () => {
    expect(checkGoalCreationGate("not_started").allowed).toBe(false);
    expect(checkGoalCreationGate("basic_verified").allowed).toBe(true);
    expect(checkGoalCreationGate("enhanced_verified").allowed).toBe(true);
  });

  it("requires enhanced KYC for monthly contributions above ₹50,000", () => {
    expect(
      checkContributionGate("basic_verified", 5_000_000).allowed,
    ).toBe(true);
    expect(
      checkContributionGate("basic_verified", 5_000_001).allowed,
    ).toBe(false);
    expect(
      checkContributionGate("enhanced_verified", 20_000_000).allowed,
    ).toBe(true);
  });

  it("does not require KYC for shop redemption", () => {
    expect(checkRedemptionGate("not_started").allowed).toBe(true);
    expect(checkRedemptionGate("basic_verified").allowed).toBe(true);
  });

  it("does not require KYC for checkout", () => {
    expect(checkCheckoutGate("not_started", 5_000_001, false).allowed).toBe(
      true,
    );
    expect(checkCheckoutGate("basic_verified", 20_000_001, false).allowed).toBe(
      true,
    );
  });
});
