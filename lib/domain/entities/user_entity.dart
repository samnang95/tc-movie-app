/// Pure business entity — no framework or serialization dependencies.
class UserEntity {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String? website;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.website,
  });
}
