enum MoviesType { popular, latest, nowPlaying, topRated, upcoming }

extension MovieTypeExtension on MoviesType {
  String get value => toString().split('.').last;

  String get name {
    String name;
    switch (this) {
      case MoviesType.popular:
        name = "Popular";
        break;
      case MoviesType.latest:
        name = "Latest";
        break;
      case MoviesType.nowPlaying:
        name = "Now Playing";
        break;
      case MoviesType.topRated:
        name = "Top rated";
        break;
      case MoviesType.upcoming:
        name = "Upcoming";
        break;
    }
    return name;
  }
}
