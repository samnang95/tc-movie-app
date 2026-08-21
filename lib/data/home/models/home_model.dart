import '../../../domain/home/homepage/entities/home.dart';

/// Data model for home page items (from API).
class HomeModel {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String? website;

  const HomeModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.website,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      website: json['website'] as String?,
    );
  }

  /// Map data model → domain entity.
  HomeItem toEntity() {
    return HomeItem(
      id: id,
      name: name,
      email: email,
      phone: phone,
      website: website,
    );
  }
}
