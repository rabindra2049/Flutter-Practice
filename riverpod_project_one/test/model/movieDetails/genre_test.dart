import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_project_one/model/movieDetails/genre.dart';

void main() {
  group("Genre Model Test", () {
    test('fromJson() should create a Genre object from JSON', () {
      final Map<String, dynamic> genreJson = {
        'id': 100,
        'name': 'John Doe',
      };
      final genre = Genre.fromJson(genreJson);

      expect(genre, isA<Genre>());
      expect(genre.id, 100);
      expect(genre.name, 'John Doe');
    });

    test("Should Serialize to JSON", () {
      final Genre genre = Genre(
        id: 100,
        name: 'John Doe',
      );

      final json = genre.toJson();
      expect(json, isA<Map<String, dynamic>>());
      expect(json['id'], 100);
      expect(json['name'], "John Doe");
    });
  });
}
