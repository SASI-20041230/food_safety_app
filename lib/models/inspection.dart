class Inspection {
  final String id;
  final String restaurantId;
  final String inspectorId;
  final DateTime inspectionDate;
  final double? overallScore;
  final String status; // 'pending', 'completed', 'failed', 'passed'
  final String? notes;
  final DateTime? nextInspectionDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<ChecklistItem> checklistItems;

  Inspection({
    required this.id,
    required this.restaurantId,
    required this.inspectorId,
    required this.inspectionDate,
    this.overallScore,
    required this.status,
    this.notes,
    this.nextInspectionDate,
    required this.createdAt,
    required this.updatedAt,
    this.checklistItems = const [],
  });

  factory Inspection.fromJson(Map<String, dynamic> json) {
    return Inspection(
      id: json['id'] ?? '',
      restaurantId: json['restaurant_id'] ?? '',
      inspectorId: json['inspector_id'] ?? '',
      inspectionDate: DateTime.parse(json['inspection_date'] ?? DateTime.now().toIso8601String()),
      overallScore: json['overall_score'] != null ? double.parse(json['overall_score'].toString()) : null,
      status: json['status'] ?? 'pending',
      notes: json['notes'],
      nextInspectionDate: json['next_inspection_date'] != null
          ? DateTime.parse(json['next_inspection_date'])
          : null,
      createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updated_at'] ?? DateTime.now().toIso8601String()),
    );
  }
}

class ChecklistItem {
  final String id;
  final String category;
  final String itemText;
  final double weight;
  final bool isCritical;
  final String? fssaiSection;

  ChecklistItem({
    required this.id,
    required this.category,
    required this.itemText,
    required this.weight,
    required this.isCritical,
    this.fssaiSection,
  });

  factory ChecklistItem.fromJson(Map<String, dynamic> json) {
    return ChecklistItem(
      id: json['id'] ?? '',
      category: json['category'] ?? '',
      itemText: json['item_text'] ?? '',
      weight: json['weight'] != null ? double.parse(json['weight'].toString()) : 1.0,
      isCritical: json['is_critical'] ?? false,
      fssaiSection: json['fssai_section'],
    );
  }
}