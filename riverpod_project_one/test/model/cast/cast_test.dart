import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_project_one/model/cast/cast.dart';
import 'package:riverpod_project_one/model/cast/casts.dart';

void main() {
  group("Cast Model Test", () {
    test('fromJson() should create a Cast object from JSON', () {
      final Map<String, dynamic> castJson = {
        'id': 1,
        'cast': [
          {
            'adult': false,
            'gender': 1,
            'id': 100,
            'known_for_department': 'Acting',
            'name': 'John Doe',
            'original_name': 'John Doe',
            'popularity': 9.8,
            'profile_path': '/profile.jpg',
            'cast_id': 1234,
            'character': 'Character Name',
            'credit_id': 'credit_id',
            'order': 1,
          }
        ]
      };
      final cast = Cast.fromJson(castJson);

      expect(cast, isA<Cast>());
      expect(cast.id, 1);
      expect(cast.cast.length, 1);

      final castEntity = cast.cast[0];
      expect(castEntity, isA<Casts>());
    });

    test("Should Serialize to JSON", () {
      final Cast cast = Cast(
        id: 1,
        cast: [
          Casts(
            adult: false,
            gender: 1,
            id: 100,
            known_for_department: 'Acting',
            name: 'John Doe',
            original_name: 'John Doe',
            popularity: 9.8,
            profile_path: '/profile.jpg',
            cast_id: 1234,
            character: 'Character Name',
            credit_id: 'credit_id',
            order: 1,
          ),
        ],
      );

      final Map<String, dynamic> castJson = cast.toJson();
      expect(castJson, isA<Map<String, dynamic>>());
      expect(castJson['id'], 1);
      expect(castJson['cast'], isA<List<dynamic>>());
      expect(castJson['cast'].length, 1);
      final castCopy = castJson['cast'][0];
      expect(castCopy, isA<Casts>());
    });
  });
}
