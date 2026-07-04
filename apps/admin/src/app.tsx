import { Navigate, Route, Routes } from "react-router-dom";
import { useEffect, useState } from "react";
import { api, loadSession } from "./api";
import { AdminShell } from "./components/AdminShell";
import { HomeRoute } from "./components/HomeRoute";
import { LoginPage } from "./components/LoginPage";
import { NavAccessGate } from "./components/NavAccessGate";
import { AuditLogsPage } from "./pages/audit-logs";
import { CataloguePage } from "./pages/catalogue";
import { CategoriesPage } from "./pages/categories";
import { CmsPage } from "./pages/cms";
import { CollectionsPage } from "./pages/collections";
import { GoldRatesPage } from "./pages/gold-rates";
import { InventoryPage } from "./pages/inventory";
import { KycPage } from "./pages/kyc";
import { NotificationsPage } from "./pages/notifications";
import { OccasionsPage } from "./pages/occasions";
import { OrdersPage, OrderDetailPage } from "./pages/orders";
import { PlansPage } from "./pages/plans";
import { ProductsPage } from "./pages/products";
import { RefundsPage } from "./pages/refunds";
import { SarReviewsPage } from "./pages/sar-reviews";
import { SettingsPage } from "./pages/settings";
import { CustomerDetailPage, UsersPage } from "./pages/users";
import { OperationsPage } from "./pages/operations";

function RequireAuth({ children }: { children: React.ReactNode }) {
  return loadSession() ? <>{children}</> : <Navigate to="/login" replace />;
}

function ProtectedPage({ children }: { children: React.ReactNode }) {
  return <NavAccessGate>{children}</NavAccessGate>;
}

export function App() {
  const [, setTick] = useState(0);

  useEffect(() => {
    void api("/v1/health").catch(() => undefined);
  }, []);

  return (
    <Routes>
      <Route path="/login" element={<LoginPage />} />
      <Route
        element={
          <RequireAuth>
            <AdminShell />
          </RequireAuth>
        }
      >
        <Route
          index
          element={
            <ProtectedPage>
              <HomeRoute />
            </ProtectedPage>
          }
        />
        <Route
          path="catalogue"
          element={
            <ProtectedPage>
              <CataloguePage />
            </ProtectedPage>
          }
        />
        <Route
          path="categories"
          element={
            <ProtectedPage>
              <CategoriesPage />
            </ProtectedPage>
          }
        />
        <Route
          path="collections"
          element={
            <ProtectedPage>
              <CollectionsPage />
            </ProtectedPage>
          }
        />
        <Route
          path="occasions"
          element={
            <ProtectedPage>
              <OccasionsPage />
            </ProtectedPage>
          }
        />
        <Route
          path="kyc"
          element={
            <ProtectedPage>
              <KycPage />
            </ProtectedPage>
          }
        />
        <Route
          path="orders/:id"
          element={
            <ProtectedPage>
              <OrderDetailPage />
            </ProtectedPage>
          }
        />
        <Route
          path="orders"
          element={
            <ProtectedPage>
              <OrdersPage />
            </ProtectedPage>
          }
        />
        <Route
          path="refunds"
          element={
            <ProtectedPage>
              <RefundsPage />
            </ProtectedPage>
          }
        />
        <Route
          path="sar-reviews"
          element={
            <ProtectedPage>
              <SarReviewsPage />
            </ProtectedPage>
          }
        />
        <Route
          path="gold-rates"
          element={
            <ProtectedPage>
              <GoldRatesPage />
            </ProtectedPage>
          }
        />
        <Route
          path="inventory"
          element={
            <ProtectedPage>
              <InventoryPage />
            </ProtectedPage>
          }
        />
        <Route
          path="operations"
          element={
            <ProtectedPage>
              <OperationsPage />
            </ProtectedPage>
          }
        />
        <Route
          path="products"
          element={
            <ProtectedPage>
              <ProductsPage />
            </ProtectedPage>
          }
        />
        <Route
          path="plans"
          element={
            <ProtectedPage>
              <PlansPage />
            </ProtectedPage>
          }
        />
        <Route
          path="cms"
          element={
            <ProtectedPage>
              <CmsPage />
            </ProtectedPage>
          }
        />
        <Route
          path="notifications"
          element={
            <ProtectedPage>
              <NotificationsPage />
            </ProtectedPage>
          }
        />
        <Route
          path="users/:id"
          element={
            <ProtectedPage>
              <CustomerDetailPage />
            </ProtectedPage>
          }
        />
        <Route
          path="users"
          element={
            <ProtectedPage>
              <UsersPage />
            </ProtectedPage>
          }
        />
        <Route
          path="audit-logs"
          element={
            <ProtectedPage>
              <AuditLogsPage />
            </ProtectedPage>
          }
        />
        <Route
          path="settings"
          element={
            <ProtectedPage>
              <SettingsPage onSessionChange={() => setTick((value) => value + 1)} />
            </ProtectedPage>
          }
        />
      </Route>
    </Routes>
  );
}
