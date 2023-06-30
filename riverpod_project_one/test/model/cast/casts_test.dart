import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_project_one/model/cast/casts.dart';

void main() {
  group("Casts Model Test", () {
    test('fromJson() should create a Casts object from JSON', () {
      final Map<String, dynamic> castsJson = {
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
        'order': 1
      };
      final casts = Casts.fromJson(castsJson);

      expect(casts, isA<Casts>());
      expect(casts.id, 100);
      expect(casts.gender, 1);
      expect(casts.adult, false);
      expect(casts.known_for_department, "Acting");
      expect(casts.name, 'John Doe');
      expect(casts.original_name, 'John Doe');
      expect(casts.popularity, 9.8);
      expect(casts.profile_path, '/profile.jpg');
      expect(casts.cast_id, 1234);
      expect(casts.character, 'Character Name');
      expect(casts.credit_id, 'credit_id');
      expect(casts.order, 1);
    });

    test("Should Serialize to JSON", () {
      final Casts casts = Casts(
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
      );

      final json = casts.toJson();
      expect(json, isA<Map<String, dynamic>>());
      expect(json['id'], 100);
      expect(json['gender'], 1);
      expect(json['adult'], false);
      expect(json['known_for_department'], "Acting");
      expect(json['name'], "John Doe");
    });
  });
}
