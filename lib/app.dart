import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:food_safety_app/providers/auth_provider.dart';
import 'package:food_safety_app/screens/auth/login_screen.dart';
import 'package:food_safety_app/screens/citizen/home_screen.dart';
import 'package:food_safety_app/screens/inspector/dashboard.dart';
import 'package:food_safety_app/screens/admin/admin_dashboard.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        if (authProvider.isLoading) {
          return const SplashScreen();
        }
        
        if (!authProvider.isAuthenticated) {
          return const LoginScreen();
        }
        
        // Route based on user role
        switch (authProvider.userRole) {
          case 'citizen':
            return const CitizenHomeScreen();
          case 'inspector':
            return const InspectorDashboard();
          case 'admin':
            return const AdminDashboard();
          default:
            return const LoginScreen();
        }
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const Icon(
                Icons.restaurant_menu,
                size: 60,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Food Safety Monitor',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'AI-Powered Hygiene Monitoring',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 40),
            const CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}