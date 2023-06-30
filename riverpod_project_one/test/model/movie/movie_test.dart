import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_project_one/model/movie/movie.dart';

void main() {
  group("Movies Model Test", () {
    test('fromJson() should create a Movie object from JSON', () {
      final Map<String, dynamic> castsJson = {
        'adult': false,
        'backdrop_path': '/backdrop.jpg',
        'genreIds': '1,2,3',
        'id': 123,
        'originalLanguage': 'en',
        'originalTitle': 'Original Title',
        'overview': 'Movie overview',
        'popularity': 9.8,
        'poster_path': '/poster.jpg',
        'releaseDate': '2022-01-01',
        'title': 'Movie Title',
        'video': true,
        'vote_average': 7.5,
        'voteCount': 1000,
      };

      final movie = Movie.fromJson(castsJson);

      expect(movie, isA<Movie>());
      expect(movie.adult, false);
      expect(movie.backdrop_path, '/backdrop.jpg');
      expect(movie.genreIds, '1,2,3');
      expect(movie.id, 123);
      expect(movie.originalLanguage, 'en');
      expect(movie.originalTitle, 'Original Title');
      expect(movie.overview, 'Movie overview');
      expect(movie.popularity, 9.8);
      expect(movie.poster_path, '/poster.jpg');
      expect(movie.releaseDate, DateTime(2022, 1, 1));
      expect(movie.title, 'Movie Title');
      expect(movie.video, true);
      expect(movie.vote_average, 7.5);
      expect(movie.voteCount, 1000);
    });

    test("Should Serialize to JSON", () {
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

      final json = movie.toJson();
      expect(json, isA<Map<String, dynamic>>());
      expect(json['adult'], true);
      expect(json['backdrop_path'], '/backdrop.jpg');
      expect(json['genreIds'], '1,2,3');
      expect(json['id'], 123);
      expect(json['originalLanguage'], 'en');
      expect(json['originalTitle'], 'Original Title');
      expect(json['overview'], 'Movie overview');
      expect(json['popularity'], 9.8);
      expect(json['poster_path'], '/poster.jpg');
      expect(json['releaseDate'], '2022-01-01T00:00:00.000');
      expect(json['title'], 'Movie Title');
      expect(json['video'], true);
      expect(json['vote_average'], 7.5);
      expect(json['voteCount'], 1000);
    });
  });
}
