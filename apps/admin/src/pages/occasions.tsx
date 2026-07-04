import {
  createOccasion,
  listOccasions,
  updateOccasion,
} from "../api/catalog";
import {
  CatalogManager,
  mapOccasionRows,
} from "../components/CatalogManager";

export function OccasionsPage() {
  return (
    <CatalogManager
      title="Occasions"
      subtitle="Tag browsing experiences for weddings, festivals, and gifting moments."
      entityLabel="Occasion"
      kind="occasion"
      loadRows={async () => {
        const result = await listOccasions();
        return mapOccasionRows(result.occasions);
      }}
      createRow={async (payload) => {
        await createOccasion(payload);
      }}
      updateRow={async (id, payload) => {
        await updateOccasion(id, payload);
      }}
    />
  );
}
