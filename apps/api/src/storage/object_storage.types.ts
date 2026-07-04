export interface StoredObject {
  key: string;
  publicUrl: string;
}

export interface ObjectStorage {
  putObject(input: {
    key: string;
    body: Buffer;
    contentType: string;
  }): Promise<StoredObject>;

  getObjectStream(key: string): Promise<NodeJS.ReadableStream | null>;

  getPublicUrl(key: string): string;
}
