import { mkdir, writeFile } from "fs/promises";
import { createReadStream as createNodeReadStream } from "fs";
import path from "path";
import { loadEnv } from "../config/env";
import type { ObjectStorage, StoredObject } from "./object_storage.types";

export class LocalObjectStorage implements ObjectStorage {
  constructor(private readonly rootDir: string) {}

  async putObject(input: {
    key: string;
    body: Buffer;
    contentType: string;
  }): Promise<StoredObject> {
    void input.contentType;
    const absolutePath = path.join(this.rootDir, input.key);
    await mkdir(path.dirname(absolutePath), { recursive: true });
    await writeFile(absolutePath, input.body);

    return {
      key: input.key,
      publicUrl: this.getPublicUrl(input.key),
    };
  }

  async getObjectStream(key: string): Promise<NodeJS.ReadableStream | null> {
    const absolutePath = path.join(this.rootDir, key.replace(/^\/+/, ""));
    try {
      return createNodeReadStream(absolutePath);
    } catch {
      return null;
    }
  }

  getPublicUrl(key: string): string {
    const env = loadEnv();
    const baseUrl = env.PUBLIC_BASE_URL.replace(/\/$/, "");
    if (key.startsWith("media/")) {
      return `${baseUrl}/uploads/${key}`;
    }
    return `${baseUrl}/uploads/${key}`;
  }
}
