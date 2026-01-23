import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoading = false;
  Map<String, dynamic>? _user;
  String? _error;

  bool get isLoading => _isLoading;
  Map<String, dynamic>? get user => _user;
  String? get error => _error;
  bool get isAuthenticated => _user != null;
  String get userRole => _user?['role'] ?? 'citizen';

  Future<bool> login(String email, String password, String role) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    // Mock user data
    _user = {
      'id': '${role}_1',
      'email': email,
      'fullName': '${role[0].toUpperCase()}${role.substring(1)} User',
      'role': role,
      'phoneNumber': '+91 9876543210',
      'isActive': true,
      'createdAt': DateTime.now().toIso8601String(),
    };

    _isLoading = false;
    notifyListeners();
    return true;
  }

  Future<void> logout() async {
    _user = null;
    _error = null;
    notifyListeners();
  }
}