import {
  createCollection,
  listCollections,
  updateCollection,
} from "../api/catalog";
import {
  CatalogManager,
  mapCollectionRows,
} from "../components/CatalogManager";

export function CollectionsPage() {
  return (
    <CatalogManager
      title="Collections"
      subtitle="Manage curated collections such as TAYA, ROSETTE, PENTAI, and RARE."
      entityLabel="Collection"
      kind="collection"
      loadRows={async () => {
        const result = await listCollections();
        return mapCollectionRows(result.collections);
      }}
      createRow={async (payload) => {
        await createCollection(payload);
      }}
      updateRow={async (id, payload) => {
        await updateCollection(id, payload);
      }}
    />
  );
}
