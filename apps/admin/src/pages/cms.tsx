import { useCallback, useEffect, useMemo, useState } from "react";

import { createBanner, listBanners, setBannerActive, updateBanner } from "../api/banners";

import { BannerForm } from "../components/BannerForm";

import { BannerTable } from "../components/BannerTable";

import { Button } from "../components/Button";

import { EmptyState } from "../components/EmptyState";

import { LoadingState } from "../components/LoadingState";

import { PageHeader } from "../components/PageHeader";

import { Panel } from "../components/Panel";

import {

  BANNER_PLACEMENTS,

  type AdminBanner,

  type BannerFormValues,

  bannerToFormValues,

  emptyBannerForm,

  formValuesToPayload,

  formatPlacement,

} from "../config/cms";



type FormMode = "closed" | "create" | "edit";



export function CmsPage() {

  const [banners, setBanners] = useState<AdminBanner[]>([]);

  const [loading, setLoading] = useState(true);

  const [listError, setListError] = useState<string | null>(null);

  const [placementFilter, setPlacementFilter] = useState("all");

  const [formMode, setFormMode] = useState<FormMode>("closed");

  const [formValues, setFormValues] = useState<BannerFormValues>(emptyBannerForm());

  const [editingBanner, setEditingBanner] = useState<AdminBanner | null>(null);

  const [formError, setFormError] = useState<string | null>(null);

  const [saving, setSaving] = useState(false);

  const [busyId, setBusyId] = useState<string | null>(null);



  const loadBanners = useCallback(async () => {

    setLoading(true);

    setListError(null);



    try {

      const result = await listBanners();

      setBanners(result.banners);

    } catch (err) {

      setListError(err instanceof Error ? err.message : "Failed to load banners");

    } finally {

      setLoading(false);

    }

  }, []);



  useEffect(() => {

    void loadBanners();

  }, [loadBanners]);



  const filteredBanners = useMemo(() => {

    if (placementFilter === "all") {

      return banners;

    }



    return banners.filter((banner) => banner.placement === placementFilter);

  }, [banners, placementFilter]);



  const placementSummary = useMemo(() => {

    return BANNER_PLACEMENTS.map((placement) => ({

      ...placement,

      total: banners.filter((banner) => banner.placement === placement.value).length,

      active: banners.filter(

        (banner) => banner.placement === placement.value && banner.is_active,

      ).length,

    }));

  }, [banners]);



  const openCreateForm = () => {

    setEditingBanner(null);

    setFormValues(emptyBannerForm());

    setFormError(null);

    setFormMode("create");

  };



  const openEditForm = (banner: AdminBanner) => {

    setEditingBanner(banner);

    setFormValues(bannerToFormValues(banner));

    setFormError(null);

    setFormMode("edit");

  };



  const closeForm = () => {

    setFormMode("closed");

    setEditingBanner(null);

    setFormError(null);

    setFormValues(emptyBannerForm());

  };



  const handleSave = async () => {

    setSaving(true);

    setFormError(null);



    try {

      const payload = formValuesToPayload(formValues, formMode === "edit");



      if (formMode === "create") {

        await createBanner(payload);

      } else if (editingBanner) {

        await updateBanner(editingBanner.id, payload);

      }



      closeForm();

      await loadBanners();

    } catch (err) {

      setFormError(err instanceof Error ? err.message : "Failed to save banner");

    } finally {

      setSaving(false);

    }

  };



  const handleToggleActive = async (banner: AdminBanner) => {

    setBusyId(banner.id);



    try {

      await setBannerActive(banner.id, !banner.is_active);

      await loadBanners();

    } catch (err) {

      setListError(err instanceof Error ? err.message : "Failed to update banner");

    } finally {

      setBusyId(null);

    }

  };



  return (

    <div className="page">

      <PageHeader

        eyebrow="Core"

        title="Banners / CMS"

        subtitle="Manage home banners and campaign placements shown in the customer app."

        action={

          formMode === "closed" ? (

            <Button onClick={openCreateForm}>New banner</Button>

          ) : null

        }

      />



      <div className="cms-summary grid-2">

        {placementSummary.map((item) => (

          <Panel key={item.value}>

            <p className="muted">{formatPlacement(item.value)}</p>

            <div className="stat">{item.active}</div>

            <div className="muted">

              active · {item.total} total

            </div>

          </Panel>

        ))}

      </div>



      {formMode !== "closed" ? (

        <Panel>

          <BannerForm

            mode={formMode}

            values={formValues}

            onChange={setFormValues}

            onSubmit={() => void handleSave()}

            onCancel={closeForm}

            saving={saving}

            error={formError}

          />

        </Panel>

      ) : null}



      <Panel title="All banners">

        <div className="page-toolbar">

          <p className="muted">

            {filteredBanners.length} banner{filteredBanners.length === 1 ? "" : "s"}

          </p>

          <select

            value={placementFilter}

            onChange={(event) => setPlacementFilter(event.target.value)}

            aria-label="Filter by placement"

          >

            <option value="all">All placements</option>

            {BANNER_PLACEMENTS.map((item) => (

              <option key={item.value} value={item.value}>

                {item.label}

              </option>

            ))}

          </select>

        </div>



        {loading ? <LoadingState label="Loading banners…" /> : null}

        {listError ? <p className="error">{listError}</p> : null}



        {!loading && !listError && filteredBanners.length === 0 ? (

          <EmptyState

            title="No banners yet"

            description="Create a banner to show promotions on the customer app home screen."

            action={<Button onClick={openCreateForm}>New banner</Button>}

          />

        ) : null}



        {!loading && filteredBanners.length > 0 ? (

          <BannerTable

            banners={filteredBanners}

            busyId={busyId}

            onEdit={openEditForm}

            onToggleActive={(banner) => void handleToggleActive(banner)}

          />

        ) : null}

      </Panel>

    </div>

  );

}

