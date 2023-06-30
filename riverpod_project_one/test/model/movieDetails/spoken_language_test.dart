import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_project_one/model/movieDetails/genre.dart';
import 'package:riverpod_project_one/model/movieDetails/spoken_language.dart';

void main() {
  group("SpokenLanguage Model Test", () {
    test('fromJson() should create a SpokenLanguage object from JSON', () {
      final Map<String, dynamic> spokenLanguageJson = {
        'english_name': 'English',
        'iso_639_1': 'en',
        'name': 'English',
      };
      final spokenLanguage = SpokenLanguage.fromJson(spokenLanguageJson);

      expect(spokenLanguage, isA<SpokenLanguage>());
      expect(spokenLanguage.english_name, 'English');
      expect(spokenLanguage.iso_639_1, 'en');
      expect(spokenLanguage.name, 'English');
    });

    test("Should convert SpokenLanguage instance to JSON", () {
      final SpokenLanguage spokenLanguage = SpokenLanguage(
        english_name: 'English',
        iso_639_1: 'en',
        name: 'English',
      );

      final json = spokenLanguage.toJson();
      expect(json, isA<Map<String, dynamic>>());
      expect(json['english_name'], 'English');
      expect(json['iso_639_1'], 'en');
      expect(json['name'], 'English');
    });

    test("Must required filled", () {
      final SpokenLanguage spokenLanguage = SpokenLanguage(
        english_name: 'English',
        iso_639_1: 'en',
        name: 'English',
      );
      expect(spokenLanguage.english_name, isNotNull);
      expect(spokenLanguage.iso_639_1, isNotNull);
      expect(spokenLanguage.name, isNotNull);
    });
  });
}
