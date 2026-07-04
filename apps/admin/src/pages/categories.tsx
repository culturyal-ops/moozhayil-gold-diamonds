import { useEffect, useState } from "react";
import {
  createCategory,
  listCategories,
  updateCategory,
} from "../api/catalog";
import {
  CatalogManager,
  mapCategoryRows,
} from "../components/CatalogManager";

export function CategoriesPage() {
  const [categoryOptions, setCategoryOptions] = useState<
    Array<{ id: string; name: string }>
  >([]);

  useEffect(() => {
    void listCategories().then((result) =>
      setCategoryOptions(
        result.categories.map((category) => ({
          id: category.id,
          name: category.name,
        })),
      ),
    );
  }, []);

  return (
    <CatalogManager
      title="Categories"
      subtitle="Organize jewellery browsing groups for the customer catalogue."
      entityLabel="Category"
      kind="category"
      categoryOptions={categoryOptions}
      loadRows={async () => {
        const result = await listCategories();
        return mapCategoryRows(result.categories);
      }}
      createRow={async (payload) => {
        await createCategory(payload);
      }}
      updateRow={async (id, payload) => {
        await updateCategory(id, payload);
      }}
    />
  );
}
