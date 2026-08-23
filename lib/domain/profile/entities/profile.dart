import '../../my_list/entities/movie_detail.dart';
import 'watch_history_item.dart';

class Profile {
  final String name;
  final String avatarPath;
  final bool isPremium;
  final List<MovieDetail> myList;
  final List<WatchHistoryItem> watchHistory;

  Profile({
    required this.name,
    required this.avatarPath,
    required this.isPremium,
    required this.myList,
    required this.watchHistory,
  });
}
