import 'package:flutter/material.dart';

class ActivityItem {
  final String id;
  final String type; // 'report_created', 'report_approved', 'restaurant_added', 'user_registered', etc.
  final String title;
  final String description;
  final String userId;
  final String userName;
  final DateTime timestamp;
  final Map<String, dynamic>? metadata;

  ActivityItem({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    required this.userId,
    required this.userName,
    required this.timestamp,
    this.metadata,
  });

  // Helper methods for activity types
  bool get isReportActivity => type.startsWith('report_');
  bool get isRestaurantActivity => type.startsWith('restaurant_');
  bool get isUserActivity => type.startsWith('user_');
  bool get isSystemActivity => type.startsWith('system_');

  IconData get icon {
    switch (type) {
      case 'report_created':
        return Icons.report;
      case 'report_approved':
        return Icons.check_circle;
      case 'report_rejected':
        return Icons.cancel;
      case 'restaurant_added':
        return Icons.restaurant;
      case 'restaurant_updated':
        return Icons.edit;
      case 'user_registered':
        return Icons.person_add;
      case 'user_login':
        return Icons.login;
      case 'inspection_completed':
        return Icons.search;
      case 'system_backup':
        return Icons.backup;
      default:
        return Icons.info;
    }
  }

  Color get color {
    switch (type) {
      case 'report_created':
        return Colors.orange;
      case 'report_approved':
        return Colors.green;
      case 'report_rejected':
        return Colors.red;
      case 'restaurant_added':
      case 'restaurant_updated':
        return Colors.blue;
      case 'user_registered':
        return Colors.purple;
      case 'inspection_completed':
        return Colors.teal;
      case 'system_backup':
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }
}

class ActivityProvider with ChangeNotifier {
  List<ActivityItem> _activities = [];
  bool _isLoading = false;
  String? _error;

  List<ActivityItem> get activities => _activities;
  List<ActivityItem> get recentActivities => _activities.take(10).toList();
  bool get isLoading => _isLoading;
  String? get error => _error;

  ActivityProvider() {
    _initializeMockData();
  }

  void _initializeMockData() {
    _activities = [
      ActivityItem(
        id: 'act_1',
        type: 'report_created',
        title: 'New Report Submitted',
        description: 'Citizen reported hygiene issues at Food Palace',
        userId: 'user_1',
        userName: 'John Doe',
        timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
        metadata: {'restaurant': 'Food Palace', 'type': 'hygiene'},
      ),
      ActivityItem(
        id: 'act_2',
        type: 'report_approved',
        title: 'Report Approved',
        description: 'Inspector approved report for Spice Garden',
        userId: 'inspector_1',
        userName: 'Inspector Smith',
        timestamp: DateTime.now().subtract(const Duration(minutes: 15)),
        metadata: {'restaurant': 'Spice Garden', 'action': 'approved'},
      ),
      ActivityItem(
        id: 'act_3',
        type: 'restaurant_added',
        title: 'New Restaurant Added',
        description: 'Pizza Corner registered in the system',
        userId: 'admin_1',
        userName: 'Admin User',
        timestamp: DateTime.now().subtract(const Duration(hours: 1)),
        metadata: {'restaurant': 'Pizza Corner'},
      ),
      ActivityItem(
        id: 'act_4',
        type: 'user_registered',
        title: 'New User Registered',
        description: 'Jane Smith joined as a citizen',
        userId: 'user_2',
        userName: 'Jane Smith',
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        metadata: {'role': 'citizen'},
      ),
      ActivityItem(
        id: 'act_5',
        type: 'inspection_completed',
        title: 'Inspection Completed',
        description: 'Burger Hub inspection completed with score 78',
        userId: 'inspector_2',
        userName: 'Inspector Johnson',
        timestamp: DateTime.now().subtract(const Duration(hours: 3)),
        metadata: {'restaurant': 'Burger Hub', 'score': 78},
      ),
      ActivityItem(
        id: 'act_6',
        type: 'report_created',
        title: 'New Report Submitted',
        description: 'Pest control issue reported at Cafe Delight',
        userId: 'user_3',
        userName: 'Robert Wilson',
        timestamp: DateTime.now().subtract(const Duration(hours: 4)),
        metadata: {'restaurant': 'Cafe Delight', 'type': 'pest_control'},
      ),
      ActivityItem(
        id: 'act_7',
        type: 'system_backup',
        title: 'System Backup Completed',
        description: 'Daily backup completed successfully',
        userId: 'system',
        userName: 'System',
        timestamp: DateTime.now().subtract(const Duration(hours: 6)),
        metadata: {'type': 'daily_backup'},
      ),
    ];
    notifyListeners();
  }

  // Add new activity (called when actions happen in the app)
  void addActivity(ActivityItem activity) {
    _activities.insert(0, activity);
    notifyListeners();
  }

  // Get activities by type
  List<ActivityItem> getActivitiesByType(String type) {
    return _activities.where((activity) => activity.type == type).toList();
  }

  // Get activities by user
  List<ActivityItem> getActivitiesByUser(String userId) {
    return _activities.where((activity) => activity.userId == userId).toList();
  }

  // Get activities within time range
  List<ActivityItem> getActivitiesInRange(DateTime start, DateTime end) {
    return _activities.where((activity) =>
      activity.timestamp.isAfter(start) && activity.timestamp.isBefore(end)
    ).toList();
  }

  // Simulate real-time updates (in a real app, this would connect to WebSocket/server-sent events)
  void simulateRealTimeUpdate() {
    // This would be called periodically or when receiving push notifications
    // For demo purposes, we'll add a random activity occasionally
  }

  // Refresh activities (simulate fetching from server)
  Future<void> refreshActivities() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 1));
      // In real app, fetch from API
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _error = 'Failed to refresh activities: $e';
      notifyListeners();
    }
  }

  // Clear old activities (for data management)
  void clearOldActivities({int daysToKeep = 30}) {
    final cutoffDate = DateTime.now().subtract(Duration(days: daysToKeep));
    _activities.removeWhere((activity) => activity.timestamp.isBefore(cutoffDate));
    notifyListeners();
  }
}