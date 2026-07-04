export function formatPaise(amountPaise: number): string {
  const rupees = Math.trunc(amountPaise / 100);
  return `₹${new Intl.NumberFormat("en-IN").format(rupees)}`;
}
