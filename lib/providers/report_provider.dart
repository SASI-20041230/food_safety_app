import 'package:flutter/material.dart';

class Report {
  final String id;
  final String restaurantId;
  final String reporterId;
  final String title;
  final String description;
  final String type;
  final List<String> imageUrls;
  final double? aiScore;
  final double? aiConfidence;
  final List<String> aiIssues;
  final String status;
  final DateTime createdAt;

  Report({
    required this.id,
    required this.restaurantId,
    required this.reporterId,
    required this.title,
    required this.description,
    required this.type,
    this.imageUrls = const [],
    this.aiScore,
    this.aiConfidence,
    this.aiIssues = const [],
    required this.status,
    required this.createdAt,
  });
}

class ReportProvider with ChangeNotifier {
  List<Report> _reports = [];
  bool _isLoading = false;
  String? _error;

  List<Report> get reports => _reports;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<Report> createReport({
    required String restaurantId,
    required String reporterId,
    required String title,
    required String description,
    required String type,
    List<String> imageUrls = const [],
  }) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    // Simulate AI analysis
    double? aiScore;
    double? aiConfidence;
    List<String> aiIssues = [];

    if (imageUrls.isNotEmpty) {
      // Mock AI analysis
      aiScore = 60 + (DateTime.now().millisecond % 40).toDouble(); // 60-100
      aiConfidence = 0.7 + (DateTime.now().second % 30) / 100; // 0.7-1.0
      
      if (aiScore < 70) {
        aiIssues = [
          'Food debris detected (${(70 + DateTime.now().millisecond % 25)}%)',
          'Surface cleanliness needs improvement (${(60 + DateTime.now().millisecond % 30)}%)',
        ];
      }
    }

    final newReport = Report(
      id: 'rep_${DateTime.now().millisecondsSinceEpoch}',
      restaurantId: restaurantId,
      reporterId: reporterId,
      title: title,
      description: description,
      type: type,
      imageUrls: imageUrls,
      aiScore: aiScore,
      aiConfidence: aiConfidence,
      aiIssues: aiIssues,
      status: 'pending',
      createdAt: DateTime.now(),
    );

    _reports.insert(0, newReport);
    
    _isLoading = false;
    notifyListeners();
    
    return newReport;
  }

  List<Report> getReportsByRestaurant(String restaurantId) {
    return _reports.where((r) => r.restaurantId == restaurantId).toList();
  }

  List<Report> getMyReports(String reporterId) {
    return _reports.where((r) => r.reporterId == reporterId).toList();
  }
}