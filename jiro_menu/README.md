# jiro_menu

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Deploy to Vercel (web)

The app can be deployed as a static web app on [Vercel](https://vercel.com). Builds run in GitHub Actions (Vercel’s environment doesn’t include the Flutter SDK).

1. **Create the project on Vercel**
   - In [Vercel](https://vercel.com) go to **Add New… → Project** and import this repo.
   - Set **Root Directory** to `jiro_menu` (Edit → set and Save).
   - Do **not** deploy yet (the first deploy will come from GitHub Actions).

2. **Get Vercel IDs**
   - Locally: `cd jiro_menu && npx vercel link`, then open `.vercel/project.json` and note `orgId` and `projectId`.
   - Or in Vercel: Project **Settings → General**: scroll to **Project ID**; **Team** settings for **Org ID**.

3. **Add GitHub secrets**
   - Repo → **Settings → Secrets and variables → Actions**.
   - Add:
     - `VERCEL_TOKEN`: [Vercel Account → Access Tokens](https://vercel.com/account/tokens) (create a token).
     - `VERCEL_ORG_ID`: value from step 2.
     - `VERCEL_PROJECT_ID`: value from step 2.

4. **Deploy**
   - Push to `main` or run the **Deploy to Vercel** workflow from the **Actions** tab.

**One-off deploy from your machine (no GitHub Actions):**

```bash
cd jiro_menu
flutter build web
cd build/web && npx vercel deploy --prod
```

(You’ll be prompted to link the project the first time; you can create a new Vercel project for the `build/web` folder.)
