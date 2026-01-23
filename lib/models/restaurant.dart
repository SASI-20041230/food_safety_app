class Restaurant {
  final String id;
  final String name;
  final String address;
  final String city;
  final String? state;
  final String? postalCode;
  final String country;
  final String? phoneNumber;
  final String? email;
  final String? ownerName;
  final String? licenseNumber;
  final double? latitude;
  final double? longitude;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  Restaurant({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    this.state,
    this.postalCode,
    this.country = 'India',
    this.phoneNumber,
    this.email,
    this.ownerName,
    this.licenseNumber,
    this.latitude,
    this.longitude,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      city: json['city'] ?? '',
      state: json['state'],
      postalCode: json['postal_code'],
      country: json['country'] ?? 'India',
      phoneNumber: json['phone_number'],
      email: json['email'],
      ownerName: json['owner_name'],
      licenseNumber: json['license_number'],
      latitude: json['latitude'] != null ? double.parse(json['latitude'].toString()) : null,
      longitude: json['longitude'] != null ? double.parse(json['longitude'].toString()) : null,
      isActive: json['is_active'] ?? true,
      createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updated_at'] ?? DateTime.now().toIso8601String()),
    );
  }
}