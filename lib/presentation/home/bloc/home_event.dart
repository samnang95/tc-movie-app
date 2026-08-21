abstract class HomeEvent {
  const HomeEvent();
}

/// Request to load home page data.
class HomeDataRequested extends HomeEvent {
  const HomeDataRequested();
}
