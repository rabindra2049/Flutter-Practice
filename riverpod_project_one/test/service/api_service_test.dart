import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

//import 'package:http/testing.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_project_one/config_file.dart';
import 'package:riverpod_project_one/model/movie/movie.dart';
import 'package:riverpod_project_one/movie_type_extension.dart';
import 'package:riverpod_project_one/service/api_service.dart';

import 'api_service_test.mocks.dart';
/*class MockClient extends Mock implements http.Client {

}*/

@GenerateMocks([http.Client])
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
      const endpoint = 'movie/upcoming';
      final queryParam = {'api_key': ConfigFile.apiKey};
      final uri = Uri.parse('$baseUrl$endpoint').replace(queryParameters: queryParam);
      const headers = {'Content-Type': 'application/json'};
      //Prepare mock response
      final Map<String, dynamic> mockMovieResponse = {
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
      };
      // Print the URI
      print(uri.toString());
      // Mock the client's response
      when(mockClient.get(uri, headers: headers)).thenAnswer(
          (_) async => http.Response(jsonEncode(mockMovieResponse), 200));

      final movie = await apiService.getUpComingMovies();

      verify(mockClient.get(uri, headers: headers));
      expect(movie, isA<List<Movie>>());

      expect(movie.length, 1);
      expect(movie[0].title, "Movie Title 1");
    });

    test("getUpcomingMOvies Should return a error with 400", () async {
      final uri = Uri.parse(
          '$baseUrl/movie/upcoming?api_key=709dd7d81d18788a7277683e0c11215f');
      const headers = {'Content-Type': 'application/json'};
      // Mock the client's response
      when(mockClient.get(uri, headers: headers))
          .thenAnswer((_) async => http.Response('', 400));

      expect(apiService.getUpComingMovies(), throwsException);

    /*  try {
        final error = await apiService.getUpComingMovies();
      } catch (error) {
        expect(error.toString(),
            "Exception: Failed to fetch upcoming movies. Error: Exception: Failed to fetch upcoming movies. Status code: 400");
      }*/
      verify(mockClient.get(uri, headers: headers));
    });
  });
  group("getMoviesByType API test", () {
    test("getMoviesByType Should return a list of movies with 200", () async {
      const movieType = MoviesType.now_playing;
      final endpoint = 'movie/${movieType.value}';
      final uri = Uri.parse(
          '$baseUrl$endpoint?api_key=709dd7d81d18788a7277683e0c11215f');
      //Prepare mock response
      final Map<String, dynamic> mockMovieResponse = {
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
        'totalPages': 81,
        'totalResults': 1614,
      };
      // Mock the client's response
      when(mockClient.get(any)).thenAnswer(
          (_) async => http.Response(jsonEncode(mockMovieResponse), 200));

      final movie = await apiService.getUpComingMovies();

      verify(mockClient.get(any));
      expect(movie, isA<List<Movie>>());

      expect(movie.length, 1);
      expect(movie[0].title, "Movie Title 1");
    });
  });
}
