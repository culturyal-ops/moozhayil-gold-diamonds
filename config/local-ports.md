# Moozhayil local port map

Use these host ports so Moozhayil does not clash with other agency projects on `3000–3005`.

| Service | Host port | Notes |
|---------|-----------|--------|
| API | **3080** | Docker maps `3080:3000`; bare-metal `PORT=3080` |
| Worker health | **3081** | Docker maps `3081:3001` |
| Admin (Docker) | **5180** | nginx serving built admin |
| Admin (Vite dev) | **5180** | Proxies `/v1` → `http://localhost:3080` |
| Postgres (Docker) | **5432** | Change compose mapping if this clashes |
| Redis (Docker) | **6379** | Change compose mapping if this clashes |
| MinIO API / console | **9000 / 9001** | S3-compatible staging storage |

Mobile dev against Docker API on Android emulator:

```bash
flutter run --dart-define=API_BASE_URL=http://10.0.2.2:3080/v1
```
