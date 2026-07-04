import type { AdminProduct } from "../config/catalog";
import { StatusBadge } from "./StatusBadge";

interface ProductTableProps {
  products: AdminProduct[];
  categoryNames: Record<string, string>;
  collectionNames: Record<string, string>;
  busyId: string | null;
  onEdit: (product: AdminProduct) => void;
  onPublish: (product: AdminProduct) => void;
}

export function ProductTable({
  products,
  categoryNames,
  collectionNames,
  busyId,
  onEdit,
  onPublish,
}: ProductTableProps) {
  return (
    <div className="banner-table-wrap">
      <table className="data-table banner-table">
        <thead>
          <tr>
            <th>Image</th>
            <th>Name</th>
            <th>SKU</th>
            <th>Category</th>
            <th>Collection</th>
            <th>Purity</th>
            <th>Weight</th>
            <th>Stock</th>
            <th>Status</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {products.map((product) => {
            const primaryImage =
              product.images.find((image) => image.is_primary) ?? product.images[0];

            return (
              <tr key={product.id}>
                <td>
                  {primaryImage ? (
                    <div className="banner-thumb">
                      <img src={primaryImage.url} alt={product.name} loading="lazy" />
                    </div>
                  ) : (
                    <span className="muted">—</span>
                  )}
                </td>
                <td>
                  <strong>{product.name}</strong>
                  {product.is_featured ? (
                    <div className="muted">Featured</div>
                  ) : null}
                </td>
                <td>{product.sku}</td>
                <td>{categoryNames[product.category_id] ?? "—"}</td>
                <td>
                  {product.collection_id
                    ? collectionNames[product.collection_id] ?? "—"
                    : "—"}
                </td>
                <td>{product.purity.toUpperCase()}</td>
                <td>{product.weight_grams} g</td>
                <td>{product.stock_quantity}</td>
                <td>
                  <StatusBadge tone={product.is_published ? "active" : "pending"}>
                    {product.is_published ? "Published" : "Draft"}
                  </StatusBadge>
                </td>
                <td>
                  <div className="banner-table__actions">
                    <button
                      type="button"
                      className="btn btn--ghost btn--sm"
                      onClick={() => onEdit(product)}
                      disabled={busyId === product.id}
                    >
                      Edit
                    </button>
                    {!product.is_published ? (
                      <button
                        type="button"
                        className="btn btn--primary btn--sm"
                        onClick={() => onPublish(product)}
                        disabled={busyId === product.id}
                      >
                        {busyId === product.id ? "Publishing…" : "Publish"}
                      </button>
                    ) : null}
                  </div>
                </td>
              </tr>
            );
          })}
        </tbody>
      </table>
    </div>
  );
}
