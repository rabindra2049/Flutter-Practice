import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:riverpod_project_one/config_file.dart';
import 'package:riverpod_project_one/model/movie/movie.dart';
import 'package:riverpod_project_one/service/api_service.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  late final String baseUrl;
  late final MockClient mockClient;
  late final ApiService apiService;
  setUpAll(() {
    baseUrl = ConfigFile.baseUrl;
    mockClient = MockClient();
    apiService = ApiService(mockClient, baseUrl);
  });
  group("getUpcomingMOvies API test", () {
    test("getUpcomingMOvies Should return a list of movies with 200", () async {
      final uri = Uri.parse(
          '$baseUrl/movie/upcoming?api_key=709dd7d81d18788a7277683e0c11215f');
      //Prepare mock response
      const mockMovieResponse = ''''{
      'page': 1,
      'results': [
        {
          'adult': true,
          'backdrop_path': '/backdrop2.jpg',
          'genreIds': '4,5,6',
          'id': 456,
          'originalLanguage': 'fr',
          'originalTitle': 'Original Title 2',
          'overview': 'Movie overview 2',
          'popularity': 8.5,
          'poster_path': '/poster2.jpg',
          'releaseDate': '2022-02-02',
          'title': 'Movie Title 1',
          'video': false,
          'vote_average': 6.5,
          'voteCount': 500,
        },
      ],
      'totalPages': 2,
      'totalResults': 2,
    }
    ''';
      // Print the URI
      print(uri.toString());
      // Mock the client's response
      when(mockClient.get(uri))
          .thenAnswer((_) async => http.Response(mockMovieResponse, 200));

      final movie = await apiService.getUpComingMovies();

      verify(mockClient.get(uri));
      expect(movie, isA<List<Movie>>());

      expect(movie.length, 1);
      expect(movie[0].title, "Movie Title 1");
    });

    test("getUpcomingMOvies Should return a error with 400", () async {
      final uri = Uri.parse(
          '$baseUrl/movie/upcoming?api_key=709dd7d81d18788a7277683e0c11215f');

      // Mock the client's response
      when(mockClient.get(uri)).thenAnswer((_) async => http.Response('', 400));

      final movie = await apiService.getUpComingMovies();

      verify(mockClient.get(uri));

      expect(movie, throwsA(isA<Error>()));
    });
  });
}
