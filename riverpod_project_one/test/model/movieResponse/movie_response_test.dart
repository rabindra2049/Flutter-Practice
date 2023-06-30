import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_project_one/model/movie/movie.dart';
import 'package:riverpod_project_one/model/movieResponse/movie_response.dart';

void main() {
  group("MovieResponse Model Test", () {
    test('fromJson() should create a MovieResponse object from JSON', () {
      final Map<String, dynamic> movieResponseJson = {
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
            'title': 'Movie Title 2',
            'video': false,
            'vote_average': 6.5,
            'voteCount': 500,
          },
        ],
        'totalPages': 2,
        'totalResults': 2,
      };

      final movieResponse = MovieResponse.fromJson(movieResponseJson);

      expect(movieResponse, isA<MovieResponse>());
      expect(movieResponse.totalResults, 2);
      expect(movieResponse.totalPages, 2);
      expect(movieResponse.page, 1);
      expect(movieResponse.results, isA<List<Movie>>());
      expect(movieResponse.results?.length, 1);
    });

    test("Should Serialize to JSON", () {
      final MovieResponse movieResponse = MovieResponse(
          page: 1,
          results: [
            Movie(
                adult: false,
                backdrop_path: '/backdrop1.jpg',
                genreIds: '1,2,3',
                id: 123,
                originalLanguage: 'en',
                originalTitle: 'Original Title 1',
                overview: 'Movie overview 1',
                popularity: 9.8,
                poster_path: '/poster1.jpg',
                releaseDate: DateTime(2022, 1, 1),
                title: 'Movie Title 1',
                video: true,
                vote_average: 7.5,
                voteCount: 1000),
          ],
          totalPages: 2,
          totalResults: 2);

      final Map<String, dynamic> movieJson = movieResponse.toJson();
      expect(movieJson, isA<Map<String, dynamic>>());
      expect(movieJson['page'], 1);
      expect(movieJson['totalPages'], 2);
      expect(movieJson['totalResults'], 2);
      expect(movieJson['results'], isA<List<dynamic>>());
      expect(movieJson['results'].length, 1);
      final movie = movieJson['results'][0];
      expect(movie, isA<Movie>());
    });
  });
}
