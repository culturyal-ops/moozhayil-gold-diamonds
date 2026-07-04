type StatusBadgeTone = "active" | "pending" | "success" | "warning" | "error" | "neutral";

interface StatusBadgeProps {
  tone?: StatusBadgeTone;
  children: React.ReactNode;
}

export function StatusBadge({ tone = "neutral", children }: StatusBadgeProps) {
  return <span className={`status-badge status-badge--${tone}`}>{children}</span>;
}
