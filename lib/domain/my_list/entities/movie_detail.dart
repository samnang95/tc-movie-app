class CastMember {
  final String name;
  final String imagePath;

  CastMember({required this.name, required this.imagePath});
}

class MovieDetail {
  final String title;
  final String posterPath;
  final List<String> badges;
  final String year;
  final double rating;
  final String duration;
  final String ageRating;
  final String synopsis;
  final List<CastMember> cast;
  final List<String> relatedMovies;

  MovieDetail({
    required this.title,
    required this.posterPath,
    required this.badges,
    required this.year,
    required this.rating,
    required this.duration,
    required this.ageRating,
    required this.synopsis,
    required this.cast,
    required this.relatedMovies,
  });
}
