import multer from "multer";
import { storeAdminMedia } from "../../utils/media_storage";

const upload = multer({
  storage: multer.memoryStorage(),
  limits: { fileSize: 8 * 1024 * 1024 },
  fileFilter: (_req, file, cb) => {
    if (!file.mimetype.startsWith("image/")) {
      cb(new Error("Only image uploads are supported"));
      return;
    }
    cb(null, true);
  },
});

export const adminMediaUploadMiddleware = upload.single("file");

export async function saveAdminMediaUpload(
  file: Express.Multer.File,
  folder: "banners" | "products",
) {
  return storeAdminMedia(file.buffer, file.mimetype, folder);
}
