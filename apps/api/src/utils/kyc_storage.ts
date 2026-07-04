import { randomUUID } from "crypto";
import { getKycObjectStorage } from "../storage";

export interface StoredKycFile {
  s3Key: string;
  publicUrl: string;
}

export async function storeKycSelfie(
  userId: string,
  buffer: Buffer,
  mimeType: string,
): Promise<StoredKycFile> {
  const extension = mimeType === "image/png" ? "png" : "jpg";
  const key = `kyc/${userId}/${randomUUID()}.${extension}`;
  const storage = getKycObjectStorage();
  const stored = await storage.putObject({
    key,
    body: buffer,
    contentType: mimeType,
  });

  return {
    s3Key: stored.key,
    publicUrl: stored.publicUrl,
  };
}

export async function openKycSelfieStream(
  selfieS3Key: string,
): Promise<NodeJS.ReadableStream | null> {
  return getKycObjectStorage().getObjectStream(selfieS3Key);
}
