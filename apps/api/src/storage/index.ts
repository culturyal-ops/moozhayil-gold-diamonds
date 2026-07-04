import { loadEnv } from "../config/env";
import { LocalObjectStorage } from "./local_object_storage";
import { S3ObjectStorage } from "./s3_object_storage";
import type { ObjectStorage } from "./object_storage.types";

let mediaStorage: ObjectStorage | undefined;
let kycStorage: ObjectStorage | undefined;

export function getMediaObjectStorage(): ObjectStorage {
  if (!mediaStorage) {
    mediaStorage = createStorage("media");
  }
  return mediaStorage;
}

export function getKycObjectStorage(): ObjectStorage {
  if (!kycStorage) {
    kycStorage = createStorage("kyc");
  }
  return kycStorage;
}

function createStorage(prefix: "media" | "kyc"): ObjectStorage {
  const env = loadEnv();

  if (env.STORAGE_BACKEND === "s3") {
    return new S3ObjectStorage();
  }

  const root =
    prefix === "kyc"
      ? env.KYC_UPLOAD_DIR
      : env.MEDIA_UPLOAD_DIR;

  return new LocalObjectStorage(root);
}

export function resetObjectStorageForTests(): void {
  mediaStorage = undefined;
  kycStorage = undefined;
}
