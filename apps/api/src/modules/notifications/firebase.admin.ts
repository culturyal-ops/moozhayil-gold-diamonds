import admin from "firebase-admin";
import { loadEnv } from "../../config/env";

let initialized = false;

export function getFirebaseMessaging(): admin.messaging.Messaging {
  if (!initialized) {
    const env = loadEnv();

    if (!env.FIREBASE_PROJECT_ID || !env.FIREBASE_CLIENT_EMAIL || !env.FIREBASE_PRIVATE_KEY) {
      throw new Error("Firebase credentials are not configured");
    }

    admin.initializeApp({
      credential: admin.credential.cert({
        projectId: env.FIREBASE_PROJECT_ID,
        clientEmail: env.FIREBASE_CLIENT_EMAIL,
        privateKey: env.FIREBASE_PRIVATE_KEY.replace(/\\n/g, "\n"),
      }),
    });

    initialized = true;
  }

  return admin.messaging();
}
