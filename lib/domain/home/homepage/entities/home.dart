/// Pure business entity representing a home page item.
class HomeItem {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String? website;

  const HomeItem({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.website,
  });
}
