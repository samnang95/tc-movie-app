import '../../domain/entities/user_entity.dart';

class UserModel {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String? website;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.website,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      website: json['website'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'website': website,
    };
  }

  /// Map data model → domain entity.
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
      phone: phone,
      website: website,
    );
  }
}
