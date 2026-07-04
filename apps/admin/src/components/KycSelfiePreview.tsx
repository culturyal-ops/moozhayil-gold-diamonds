import { useEffect, useState } from "react";
import { fetchKycSelfieUrl } from "../api/kyc";

export function KycSelfiePreview({ userId }: { userId: string }) {
  const [src, setSrc] = useState<string | null>(null);

  useEffect(() => {
    let objectUrl: string | null = null;
    let cancelled = false;

    void fetchKycSelfieUrl(userId).then((url) => {
      if (cancelled || !url) {
        return;
      }

      objectUrl = url;
      setSrc(url);
    });

    return () => {
      cancelled = true;
      if (objectUrl) {
        URL.revokeObjectURL(objectUrl);
      }
    };
  }, [userId]);

  if (!src) {
    return <span className="muted">No preview</span>;
  }

  return (
    <img
      src={src}
      alt="KYC selfie"
      className="kyc-selfie-preview"
      width={72}
      height={72}
    />
  );
}
