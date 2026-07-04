import { FormEvent, useState } from "react";
import { useNavigate } from "react-router-dom";
import { login } from "../api";
import { BrandMark } from "./BrandMark";
import { Button } from "./Button";
import { Input } from "./Input";

export function LoginPage() {
  const navigate = useNavigate();
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState<string | null>(null);
  const [loading, setLoading] = useState(false);

  const handleSubmit = (event: FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    setError(null);
    setLoading(true);

    void login(email, password)
      .then(() => navigate("/"))
      .catch((err: Error) => setError(err.message))
      .finally(() => setLoading(false));
  };

  return (
    <div className="login-page">
      <div className="login-page__brand-panel">
        <div className="login-page__brand-inner">
          <BrandMark variant="editorial" />
          <div className="login-page__rule" aria-hidden="true" />
          <p className="login-page__headline">Private office</p>
          <p className="login-page__brand-copy">
            A discreet console for catalogue, client care, schemes, and maison
            operations — crafted with the same restraint as the showroom floor.
          </p>
        </div>
      </div>

      <div className="login-page__form-panel">
        <form className="login-card" onSubmit={handleSubmit} noValidate>
          <div className="login-card__header">
            <p className="login-card__eyebrow">Staff access</p>
            <h1 className="login-card__title">Sign in</h1>
            <p className="login-card__subtitle">
              Enter your credentials to access the operations suite.
            </p>
          </div>

          {error ? (
            <div className="login-card__alert" role="alert">
              {error}
            </div>
          ) : null}

          <Input
            label="Email"
            type="email"
            name="email"
            autoComplete="email"
            placeholder="name@moozhayil.com"
            value={email}
            onChange={(event) => setEmail(event.target.value)}
            required
            disabled={loading}
          />

          <Input
            label="Password"
            type="password"
            name="password"
            autoComplete="current-password"
            placeholder="••••••••"
            value={password}
            onChange={(event) => setPassword(event.target.value)}
            required
            disabled={loading}
          />

          <Button type="submit" loading={loading} className="login-card__submit">
            Continue
          </Button>
        </form>
      </div>
    </div>
  );
}
