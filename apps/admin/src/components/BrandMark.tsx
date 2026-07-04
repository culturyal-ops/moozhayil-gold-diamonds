interface BrandMarkProps {
  compact?: boolean;
  variant?: "default" | "inverse" | "editorial";
  className?: string;
}

/** Moozhayil maison mark — editorial monogram until brand assets ship. */
export function BrandMark({
  compact = false,
  variant = "default",
  className = "",
}: BrandMarkProps) {
  return (
    <div
      className={[
        "brand-mark",
        compact ? "brand-mark--compact" : "",
        variant !== "default" ? `brand-mark--${variant}` : "",
        className,
      ]
        .filter(Boolean)
        .join(" ")}
    >
      <span className="brand-mark__monogram" aria-hidden="true">
        M
      </span>
      <div className="brand-mark__text">
        <span className="brand-mark__name">Moozhayil</span>
        {!compact && (
          <span className="brand-mark__tag">
            {variant === "editorial" ? "Gold & Diamonds" : "Maison"}
          </span>
        )}
      </div>
    </div>
  );
}
