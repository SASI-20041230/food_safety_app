import 'package:flutter/material.dart';

class Restaurant {
  final String id;
  final String name;
  final String address;
  final String city;
  final String? phoneNumber;
  final double rating;
  final String status;
  final int inspectionCount;

  Restaurant({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    this.phoneNumber,
    required this.rating,
    required this.status,
    required this.inspectionCount,
  });
}

class RestaurantProvider with ChangeNotifier {
  List<Restaurant> _restaurants = [
    Restaurant(
      id: '1',
      name: 'Food Haven Restaurant',
      address: '123 Main Street, Colaba',
      city: 'Mumbai',
      phoneNumber: '+91 9876543210',
      rating: 4.5,
      status: 'Excellent',
      inspectionCount: 12,
    ),
    Restaurant(
      id: '2',
      name: 'Spice Palace',
      address: '456 Park Avenue, Connaught Place',
      city: 'Delhi',
      phoneNumber: '+91 9876543211',
      rating: 4.2,
      status: 'Good',
      inspectionCount: 8,
    ),
    Restaurant(
      id: '3',
      name: 'Ocean View Cafe',
      address: '789 Beach Road, Calangute',
      city: 'Goa',
      phoneNumber: '+91 9876543212',
      rating: 3.8,
      status: 'Average',
      inspectionCount: 15,
    ),
    Restaurant(
      id: '4',
      name: 'Quick Bites Fast Food',
      address: '321 Market Street, MG Road',
      city: 'Bangalore',
      phoneNumber: '+91 9876543213',
      rating: 2.5,
      status: 'Poor',
      inspectionCount: 20,
    ),
    Restaurant(
      id: '5',
      name: 'Green Leaf Vegetarian',
      address: '654 Garden Lane, Jubilee Hills',
      city: 'Hyderabad',
      phoneNumber: '+91 9876543214',
      rating: 1.8,
      status: 'Critical',
      inspectionCount: 25,
    ),
  ];

  bool _isLoading = false;
  String? _error;

  List<Restaurant> get restaurants => _restaurants;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'excellent':
        return Colors.green;
      case 'good':
        return Colors.blue;
      case 'average':
        return Colors.orange;
      case 'poor':
        return Colors.orange.shade700;
      case 'critical':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  List<Restaurant> getTopRatedRestaurants({int limit = 3}) {
    final sorted = List<Restaurant>.from(_restaurants);
    sorted.sort((a, b) => b.rating.compareTo(a.rating));
    return sorted.take(limit).toList();
  }

  List<Restaurant> getPoorRatedRestaurants({int limit = 3}) {
    final sorted = List<Restaurant>.from(_restaurants);
    sorted.sort((a, b) => a.rating.compareTo(b.rating));
    return sorted.take(limit).toList();
  }

  Restaurant? getRestaurantById(String id) {
    try {
      return _restaurants.firstWhere((r) => r.id == id);
    } catch (e) {
      return null;
    }
  }
}