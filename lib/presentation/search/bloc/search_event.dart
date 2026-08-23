abstract class SearchEvent {
  const SearchEvent();
}

/// Request to load recommended search data.
class SearchDataRequested extends SearchEvent {
  const SearchDataRequested();
}
