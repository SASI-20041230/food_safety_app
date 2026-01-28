import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:food_guard/config/constants.dart';

class SupabaseService {
  SupabaseService._();

  static SupabaseClient get client => Supabase.instance.client;

  // Admin client for operations requiring service role key
  static SupabaseClient get adminClient {
    return SupabaseClient(
      AppConstants.supabaseUrl,
      AppConstants.supabaseServiceRoleKey,
    );
  }

  static Future<void> init() async {
    // Ensure the user has set their URL and anon key in AppConstants
    if (AppConstants.supabaseUrl == 'https://cgdbwwgcdgdjqlevimxi.supabase.co' ||
        AppConstants.supabaseAnonKey == 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNnZGJ3d2djZGdkanFsZXZpbXhpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTcyMjUsImV4cCI6MjA4NTA5MzIyNX0._qZqqVW74FBD5EoXtEe1q8orXhyKpMEE9dwO3B2vnDU') {
      // Do not throw here; leave placeholders so the developer can fill them.
      // Supabase.initialize will fail if placeholders are not replaced.
    }

    await Supabase.initialize(
      url: AppConstants.supabaseUrl,
      anonKey: AppConstants.supabaseAnonKey,
    );
  }
}
