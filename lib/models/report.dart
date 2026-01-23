class CitizenReport {
  final String id;
  final String restaurantId;
  final String reporterId;
  final String title;
  final String description;
  final String reportType; // 'hygiene', 'food_quality', 'safety', 'other'
  final List<String> imageUrls;
  final double? aiHygieneScore;
  final double? aiConfidence;
  final List<String> aiIssuesDetected;
  final String status; // 'pending', 'under_review', 'resolved', 'dismissed'
  final String? adminNotes;
  final double? latitude;
  final double? longitude;
  final DateTime createdAt;
  final DateTime updatedAt;

  CitizenReport({
    required this.id,
    required this.restaurantId,
    required this.reporterId,
    required this.title,
    required this.description,
    this.reportType = 'hygiene',
    this.imageUrls = const [],
    this.aiHygieneScore,
    this.aiConfidence,
    this.aiIssuesDetected = const [],
    this.status = 'pending',
    this.adminNotes,
    this.latitude,
    this.longitude,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CitizenReport.fromJson(Map<String, dynamic> json) {
    return CitizenReport(
      id: json['id'] ?? '',
      restaurantId: json['restaurant_id'] ?? '',
      reporterId: json['reporter_id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      reportType: json['report_type'] ?? 'hygiene',
      imageUrls: List<String>.from(json['image_urls'] ?? []),
      aiHygieneScore: json['ai_hygiene_score'] != null
          ? double.parse(json['ai_hygiene_score'].toString())
          : null,
      aiConfidence: json['ai_confidence'] != null
          ? double.parse(json['ai_confidence'].toString())
          : null,
      aiIssuesDetected: List<String>.from(json['ai_issues_detected'] ?? []),
      status: json['status'] ?? 'pending',
      adminNotes: json['admin_notes'],
      latitude: json['latitude'] != null
          ? double.parse(json['latitude'].toString())
          : null,
      longitude: json['longitude'] != null
          ? double.parse(json['longitude'].toString())
          : null,
      createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updated_at'] ?? DateTime.now().toIso8601String()),
    );
  }
}