import '../../../domain/search/entities/search_item.dart';

/// Data model for search items (from API).
class SearchModel {
  final int id;
  final String title;
  final String genre;
  final String duration;
  final bool is4K;
  final bool isNew;

  const SearchModel({
    required this.id,
    required this.title,
    required this.genre,
    required this.duration,
    this.is4K = false,
    this.isNew = false,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      genre: json['genre'] as String? ?? '',
      duration: json['duration'] as String? ?? '',
      is4K: json['is4K'] as bool? ?? false,
      isNew: json['isNew'] as bool? ?? false,
    );
  }

  /// Map data model → domain entity.
  SearchItem toEntity() {
    return SearchItem(
      id: id,
      title: title,
      genre: genre,
      duration: duration,
      is4K: is4K,
      isNew: isNew,
    );
  }
}
