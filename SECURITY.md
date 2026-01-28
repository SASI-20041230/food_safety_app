# Security Setup Guide

## Protecting Sensitive Keys

Your Supabase API keys are now protected from accidental commits to GitHub.

### Setup Instructions

1. **Get your Supabase credentials:**
   - Go to [Supabase Dashboard](https://supabase.com)
   - Select your project
   - Go to **Settings → API**
   - Copy your:
     - **Project URL** (e.g., `https://xxxxx.supabase.co`)
     - **Anon Key** (public, safe for client apps)
     - **Service Role Key** (keep secret, server only)

2. **Update `lib/config/constants.dart`:**
   ```dart
   static const String supabaseUrl = 'https://YOUR_PROJECT_ID.supabase.co';
   static const String supabaseAnonKey = 'YOUR_ANON_KEY_HERE';
   static const String supabaseServiceRoleKey = 'YOUR_SERVICE_ROLE_KEY_HERE';
   ```

3. **Do NOT commit `lib/config/constants.dart` to GitHub:**
   - This file is in `.gitignore` and won't be committed
   - Keep it on your local machine only

4. **For team collaboration:**
   - Share credentials through secure channels (1Password, LastPass, etc.)
   - Never email or commit keys to GitHub
   - Use the `.example` file as a reference template

### What's Protected

- `lib/config/constants.dart` - Won't be committed (contains your real keys)
- `.env` files - Won't be committed (for future environment setup)

### Before Pushing to GitHub

1. **Rotate your Supabase keys immediately:**
   - Go to Supabase Dashboard → Settings → API
   - Click "Regenerate" for Anon Key and Service Role Key
   - This invalidates the old keys that may have been exposed

2. **Verify `.gitignore` includes:**
   ```
   lib/config/constants.dart
   .env
   .env.local
   ```

3. **Commit the cleanup:**
   ```bash
   git add .gitignore lib/config/constants.dart
   git commit -m "chore: protect sensitive Supabase keys from version control"
   ```

### Safe to Commit

- `lib/config/constants.dart.example` - Template only, no real keys
- `README.md` - General documentation
- `pubspec.yaml` - Dependencies (no secrets)
- All other source code

## Additional Security Tips

1. **Never use Service Role Key in client apps** - Only use the Anon Key in Flutter
2. **Use Row Level Security (RLS)** on your Supabase tables
3. **Monitor API usage** in Supabase Dashboard for unusual activity
4. **Rotate keys regularly** every 30-90 days in production
5. **Use different keys** for development and production environments

## Troubleshooting

If your app fails to connect:
1. Check that `supabaseUrl` and `supabaseAnonKey` are correctly filled
2. Ensure you have the INTERNET permission in `AndroidManifest.xml`
3. Check Supabase project is active and database is accessible
4. Verify Supabase credentials match your project exactly
