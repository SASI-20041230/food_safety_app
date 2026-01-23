import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:food_guard/providers/auth_provider.dart';
import 'package:food_guard/screens/auth/login_screen.dart';
import 'package:food_guard/screens/citizen/home_screen.dart';
import 'package:food_guard/screens/inspector/dashboard.dart';
import 'package:food_guard/screens/admin/admin_dashboard.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Safety App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          elevation: 4,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          fillColor: Colors.grey[50],
        ),
        cardTheme: const CardThemeData(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
      ),
      home: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          print('DEBUG: App.dart Consumer - isLoading: ${authProvider.isLoading}, isAuthenticated: ${authProvider.isAuthenticated}, userRole: ${authProvider.userRole}');
          
          if (authProvider.isLoading) {
            print('DEBUG: Showing SplashScreen');
            return const SplashScreen();
          }
          
          if (!authProvider.isAuthenticated) {
            print('DEBUG: Showing LoginScreen');
            return const LoginScreen();
          }
          
          // Route based on user role
          switch (authProvider.userRole) {
            case 'citizen':
              print('DEBUG: Routing to CitizenHomeScreen');
              return const CitizenHomeScreen();
            case 'inspector':
              print('DEBUG: Routing to InspectorDashboard');
              return const InspectorDashboard();
            case 'admin':
              print('DEBUG: Routing to AdminDashboard');
              return AdminDashboard();
            default:
              print('DEBUG: Default routing to LoginScreen');
              return const LoginScreen();
          }
        },
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/citizen': (context) => const CitizenHomeScreen(),
        '/inspector': (context) => const InspectorDashboard(),
        '/admin': (context) => const AdminDashboard(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 25,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: const Icon(
                Icons.restaurant_menu,
                size: 70,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Food Safety Monitor',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'AI-Powered Hygiene Monitoring System',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 50),
            Container(
              width: 80,
              height: 80,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(40),
              ),
              child: const CircularProgressIndicator(
                strokeWidth: 3,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shield, color: Colors.white70, size: 18),
                SizedBox(width: 8),
                Text(
                  'Ensuring Public Health & Safety',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}