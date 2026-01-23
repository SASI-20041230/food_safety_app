class RestaurantRating {
  final String id;
  final String restaurantId;
  final double overallRating; // 0-5 stars
  final double hygieneScore; // 0-100
  final double? inspectionScore;
  final double? citizenReportScore;
  final DateTime? lastInspectionDate;
  final int totalInspections;
  final int totalCitizenReports;
  final String ratingCategory; // 'excellent', 'good', 'average', 'poor', 'critical'
  final DateTime updatedAt;

  RestaurantRating({
    required this.id,
    required this.restaurantId,
    required this.overallRating,
    required this.hygieneScore,
    this.inspectionScore,
    this.citizenReportScore,
    this.lastInspectionDate,
    required this.totalInspections,
    required this.totalCitizenReports,
    required this.ratingCategory,
    required this.updatedAt,
  });

  factory RestaurantRating.fromJson(Map<String, dynamic> json) {
    return RestaurantRating(
      id: json['id'] ?? '',
      restaurantId: json['restaurant_id'] ?? '',
      overallRating: json['overall_rating'] != null
          ? double.parse(json['overall_rating'].toString())
          : 0.0,
      hygieneScore: json['hygiene_score'] != null
          ? double.parse(json['hygiene_score'].toString())
          : 0.0,
      inspectionScore: json['inspection_score'] != null
          ? double.parse(json['inspection_score'].toString())
          : null,
      citizenReportScore: json['citizen_report_score'] != null
          ? double.parse(json['citizen_report_score'].toString())
          : null,
      lastInspectionDate: json['last_inspection_date'] != null
          ? DateTime.parse(json['last_inspection_date'])
          : null,
      totalInspections: json['total_inspections'] ?? 0,
      totalCitizenReports: json['total_citizen_reports'] ?? 0,
      ratingCategory: json['rating_category'] ?? 'critical',
      updatedAt: DateTime.parse(json['updated_at'] ?? DateTime.now().toIso8601String()),
    );
  }
}