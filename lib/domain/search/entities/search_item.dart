/// Pure business entity representing a search result movie item.
class SearchItem {
  final int id;
  final String title;
  final String genre;
  final String duration;
  final bool is4K;
  final bool isNew;

  const SearchItem({
    required this.id,
    required this.title,
    required this.genre,
    required this.duration,
    this.is4K = false,
    this.isNew = false,
  });
}
