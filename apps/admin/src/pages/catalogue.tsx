import { Link } from "react-router-dom";
import { PageHeader } from "../components/PageHeader";
import { Panel } from "../components/Panel";

const LINKS = [
  {
    to: "/products",
    title: "Products",
    description: "Create and publish jewellery SKUs with pricing and stock.",
  },
  {
    to: "/categories",
    title: "Categories",
    description: "Manage catalogue categories and optional parent hierarchy.",
  },
  {
    to: "/collections",
    title: "Collections",
    description: "Curated collections and sub-brand groupings.",
  },
  {
    to: "/occasions",
    title: "Occasions",
    description: "Occasion-based browsing tags for the customer app.",
  },
  {
    to: "/inventory",
    title: "Inventory",
    description: "Review stock levels and low-stock alerts.",
  },
  {
    to: "/cms",
    title: "Banners / CMS",
    description: "Home banners and campaign placements.",
  },
];

export function CataloguePage() {
  return (
    <div className="page">
      <PageHeader
        eyebrow="Core"
        title="Catalogue"
        subtitle="Manage products, browsing structure, and merchandising for the customer app."
      />

      <div className="catalogue-grid">
        {LINKS.map((link) => (
          <Link key={link.to} to={link.to} className="catalogue-card">
            <Panel>
              <h3 className="catalogue-card__title">{link.title}</h3>
              <p className="muted">{link.description}</p>
              <span className="catalogue-card__cta">Open →</span>
            </Panel>
          </Link>
        ))}
      </div>
    </div>
  );
}
