import { redactObject, redactString } from "../src/utils/pii";

describe("PII redaction", () => {
  it("redacts sensitive keys and masks string values", () => {
    const redacted = redactObject({
      aadhaar_number: "123456789012",
      pan_number: "ABCDE1234F",
      name: "Priya Menon",
      nested: {
        phone: "+919876543210",
      },
    });

    expect(redacted.aadhaar_number).not.toBe("123456789012");
    expect(redacted.pan_number).not.toBe("ABCDE1234F");
    expect(redacted.nested).toEqual({
      phone: expect.not.stringContaining("9876543210"),
    });
    expect(redactString("123456789012")).not.toContain("789012");
  });
});
