import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_project_one/model/movieDetails/genre.dart';
import 'package:riverpod_project_one/model/movieDetails/movie_details.dart';
import 'package:riverpod_project_one/model/movieDetails/production_company.dart';
import 'package:riverpod_project_one/model/movieDetails/production_country.dart';
import 'package:riverpod_project_one/model/movieDetails/spoken_language.dart';

void main() {
  group("MovieDetails Model Test", () {
    test('fromJson() should create a MovieDetails object from JSON', () {
      final Map<String, dynamic> movieDetailsJson = {
        'adult': true,
        'backdrop_path': '/backdrop.jpg',
        'belongs_to_collection': null,
        'budget': 1000000,
        'genres': [],
        'homepage': 'https://example.com',
        'id': 123,
        'imdb_id': 'tt1234567',
        'original_language': 'en',
        'original_title': 'Original Title',
        'overview': 'Movie overview',
        'popularity': 9.8,
        'poster_path': '/poster.jpg',
        'production_companies': [],
        'production_countries': [],
        'release_date': '2023-06-30',
        'revenue': 10000000,
        'runtime': 120,
        'spoken_languages': [],
        'status': 'Released',
        'tagline': 'Movie tagline',
        'title': 'Movie Title',
        'video': false,
        'vote_average': 7.5,
        'vote_count': 100,
      };
      final movieDetails = MovieDetails.fromJson(movieDetailsJson);

      expect(movieDetails, isA<MovieDetails>());
      expect(movieDetails.id, 123);
      expect(movieDetails, isA<MovieDetails>());
      expect(movieDetails.adult, isTrue);
      expect(movieDetails.backdrop_path, '/backdrop.jpg');
      expect(movieDetails.belongs_to_collection, isNull);
      expect(movieDetails.budget, 1000000);
      expect(movieDetails.genres, isA<List<Genre>>());
      expect(movieDetails.genres!.length, 0);
      expect(movieDetails.homepage, 'https://example.com');
      expect(movieDetails.id, 123);
      expect(movieDetails.imdb_id, 'tt1234567');
      expect(movieDetails.original_language, 'en');
      expect(movieDetails.original_title, 'Original Title');
      expect(movieDetails.overview, 'Movie overview');
      expect(movieDetails.popularity, 9.8);
      expect(movieDetails.poster_path, '/poster.jpg');
      expect(movieDetails.production_companies, isA<List<ProductionCompany>>());
      expect(movieDetails.production_companies.length, 0);
      expect(movieDetails.production_countries, isA<List<ProductionCountry>>());
      expect(movieDetails.production_countries.length, 0);
      expect(movieDetails.release_date, '2023-06-30');
      expect(movieDetails.revenue, 10000000);
      expect(movieDetails.runtime, 120);
      expect(movieDetails.spoken_languages, isA<List<SpokenLanguage>>());
      expect(movieDetails.spoken_languages.length, 0);
      expect(movieDetails.status, 'Released');
      expect(movieDetails.tagline, 'Movie tagline');
      expect(movieDetails.title, 'Movie Title');
      expect(movieDetails.video, isFalse);
      expect(movieDetails.vote_average, 7.5);
      expect(movieDetails.vote_count, 100);
    });

    test("Should Serialize to JSON", () {
      final MovieDetails movieDetails = MovieDetails(
        adult: true,
        backdrop_path: '/backdrop.jpg',
        belongs_to_collection: null,
        budget: 1000000,
        genres: [],
        homepage: 'https://example.com',
        id: 123,
        imdb_id: 'tt1234567',
        original_language: 'en',
        original_title: 'Original Title',
        overview: 'Movie overview',
        popularity: 9.8,
        poster_path: '/poster.jpg',
        production_companies: [],
        production_countries: [],
        release_date: '2023-06-30',
        revenue: 10000000,
        runtime: 120,
        spoken_languages: [],
        status: 'Released',
        tagline: 'Movie tagline',
        title: 'Movie Title',
        video: false,
        vote_average: 7.5,
        vote_count: 100,
      );

      final Map<String, dynamic> movieDetailsJson = movieDetails.toJson();
      expect(movieDetailsJson, isA<Map<String, dynamic>>());
      expect(movieDetailsJson, isA<Map<String, dynamic>>());
      expect(movieDetailsJson['adult'], true);
      expect(movieDetailsJson['backdrop_path'], '/backdrop.jpg');
      expect(movieDetailsJson['belongs_to_collection'], isNull);
      expect(movieDetailsJson['budget'], 1000000);
      expect(movieDetailsJson['genres'], isA<List<dynamic>>());
      expect(movieDetailsJson['genres'].length, 0);
      expect(movieDetailsJson['homepage'], 'https://example.com');
      expect(movieDetailsJson['id'], 123);
      expect(movieDetailsJson['imdb_id'], 'tt1234567');
      expect(movieDetailsJson['original_language'], 'en');
      expect(movieDetailsJson['original_title'], 'Original Title');
      expect(movieDetailsJson['overview'], 'Movie overview');
      expect(movieDetailsJson['popularity'], 9.8);
      expect(movieDetailsJson['poster_path'], '/poster.jpg');
      expect(movieDetailsJson['production_companies'], isA<List<dynamic>>());
      expect(movieDetailsJson['production_companies'].length, 0);
      expect(movieDetailsJson['production_countries'], isA<List<dynamic>>());
      expect(movieDetailsJson['production_countries'].length, 0);
      expect(movieDetailsJson['release_date'], '2023-06-30');
      expect(movieDetailsJson['revenue'], 10000000);
      expect(movieDetailsJson['runtime'], 120);
      expect(movieDetailsJson['spoken_languages'], isA<List<dynamic>>());
      expect(movieDetailsJson['spoken_languages'].length, 0);
      expect(movieDetailsJson['status'], 'Released');
      expect(movieDetailsJson['tagline'], 'Movie tagline');
      expect(movieDetailsJson['title'], 'Movie Title');
      expect(movieDetailsJson['video'], false);
      expect(movieDetailsJson['vote_average'], 7.5);
      expect(movieDetailsJson['vote_count'], 100);
    });
  });
}
