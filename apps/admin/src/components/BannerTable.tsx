import type { AdminBanner } from "../config/cms";
import { formatBannerDate, formatPlacement } from "../config/cms";
import { StatusBadge } from "./StatusBadge";

interface BannerTableProps {
  banners: AdminBanner[];
  busyId: string | null;
  onEdit: (banner: AdminBanner) => void;
  onToggleActive: (banner: AdminBanner) => void;
}

export function BannerTable({
  banners,
  busyId,
  onEdit,
  onToggleActive,
}: BannerTableProps) {
  if (banners.length === 0) {
    return null;
  }

  return (
    <div className="banner-table-wrap">
      <table className="data-table banner-table">
        <thead>
          <tr>
            <th>Preview</th>
            <th>Title</th>
            <th>Placement</th>
            <th>Sort</th>
            <th>Valid from</th>
            <th>Valid to</th>
            <th>CTA</th>
            <th>Status</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {banners.map((banner) => (
            <tr key={banner.id}>
              <td>
                <BannerThumb imageUrl={banner.image_url} title={banner.title} />
              </td>
              <td>
                <strong>{banner.title}</strong>
              </td>
              <td>{formatPlacement(banner.placement)}</td>
              <td>{banner.sort_order}</td>
              <td>{formatBannerDate(banner.valid_from)}</td>
              <td>{formatBannerDate(banner.valid_to)}</td>
              <td>
                {banner.cta_label ? (
                  <span className="banner-table__cta">
                    {banner.cta_label}
                    {banner.cta_route ? (
                      <span className="muted"> → {banner.cta_route}</span>
                    ) : null}
                  </span>
                ) : (
                  "—"
                )}
              </td>
              <td>
                <StatusBadge tone={banner.is_active ? "active" : "neutral"}>
                  {banner.is_active ? "Active" : "Inactive"}
                </StatusBadge>
              </td>
              <td>
                <div className="banner-table__actions">
                  <button
                    type="button"
                    className="btn btn--ghost btn--sm"
                    onClick={() => onEdit(banner)}
                    disabled={busyId === banner.id}
                  >
                    Edit
                  </button>
                  <button
                    type="button"
                    className={`btn btn--sm${banner.is_active ? " btn--secondary" : " btn--primary"}`}
                    onClick={() => onToggleActive(banner)}
                    disabled={busyId === banner.id}
                  >
                    {busyId === banner.id
                      ? "Saving…"
                      : banner.is_active
                        ? "Unpublish"
                        : "Publish"}
                  </button>
                </div>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

function BannerThumb({ imageUrl, title }: { imageUrl: string; title: string }) {
  return (
    <div className="banner-thumb">
      <img src={imageUrl} alt={title} loading="lazy" />
    </div>
  );
}
