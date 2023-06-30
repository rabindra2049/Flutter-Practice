import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_project_one/movie_type_extension.dart';

void main() {
  test("MovieTypeExtension.value returns correct value", () {
    expect(MoviesType.popular.value, 'popular');
    expect(MoviesType.latest.value, 'latest');
    expect(MoviesType.now_playing.value, 'now_playing');
    expect(MoviesType.top_rated.value, 'top_rated');
    expect(MoviesType.upcoming.value, 'upcoming');
  });
  test("MovieTypeExtension.name returns correct name", () {
    expect(MoviesType.popular.name, 'Popular');
    expect(MoviesType.latest.name, 'Latest');
    expect(MoviesType.now_playing.name, 'Now Playing');
    expect(MoviesType.top_rated.name, 'Top rated');
    expect(MoviesType.upcoming.name, 'Upcoming');
  });
}
