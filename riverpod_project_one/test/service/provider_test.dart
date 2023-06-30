import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:riverpod_project_one/model/movie/movie.dart';
import 'package:riverpod_project_one/service/api_service.dart';
import 'package:riverpod_project_one/service/provider.dart';

class MockClient extends Mock implements http.Client {}

class MockApiService extends Mock implements ApiService {}

void main() {
  late final MockClient mockClient;
  late final MockApiService mockApiService;
  setUpAll(() {
    mockClient = MockClient();
    mockApiService = MockApiService();
  });

  test("UpcomingProvider returns a list of movies", () {
    final Movie movie = Movie(
      adult: true,
      backdrop_path: '/backdrop.jpg',
      genreIds: '1,2,3',
      id: 123,
      originalLanguage: 'en',
      originalTitle: 'Original Title',
      overview: 'Movie overview',
      popularity: 9.8,
      poster_path: '/poster.jpg',
      releaseDate: DateTime(2022, 1, 1),
      title: 'Movie Title',
      video: true,
      vote_average: 7.5,
      voteCount: 1000,
    );
    final movies = [movie];
    when(mockApiService.getUpComingMovies()).thenAnswer((_) async => movies);

    final providerContainer = ProviderContainer(overrides: [
      httpProvider.overrideWithValue(mockClient),
      apiServiceProvider.overrideWithValue(mockApiService),
    ]);

    final result = providerContainer.read(upcomingProvider);

    expect(result, emits(movies));
  });
}
