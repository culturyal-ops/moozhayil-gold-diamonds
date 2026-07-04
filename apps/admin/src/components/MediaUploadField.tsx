import { useRef, useState } from "react";
import { uploadAdminMedia } from "../api/uploads";
import { Button } from "./Button";

interface MediaUploadFieldProps {
  folder: "banners" | "products";
  onUploaded: (url: string) => void;
  disabled?: boolean;
}

export function MediaUploadField({
  folder,
  onUploaded,
  disabled = false,
}: MediaUploadFieldProps) {
  const inputRef = useRef<HTMLInputElement>(null);
  const [uploading, setUploading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const handleFile = async (file: File | undefined) => {
    if (!file) return;

    setUploading(true);
    setError(null);
    try {
      const result = await uploadAdminMedia(file, folder);
      onUploaded(result.url);
    } catch (err) {
      setError(err instanceof Error ? err.message : "Upload failed");
    } finally {
      setUploading(false);
      if (inputRef.current) {
        inputRef.current.value = "";
      }
    }
  };

  return (
    <div className="media-upload-field">
      <input
        ref={inputRef}
        type="file"
        accept="image/*"
        hidden
        disabled={disabled || uploading}
        onChange={(event) => void handleFile(event.target.files?.[0])}
      />
      <Button
        type="button"
        variant="secondary"
        loading={uploading}
        disabled={disabled}
        onClick={() => inputRef.current?.click()}
      >
        Upload image
      </Button>
      <p className="muted">
        Saves to local media storage for development. Paste the returned URL or
        use a CDN URL in production.
      </p>
      {error ? <p className="error">{error}</p> : null}
    </div>
  );
}
