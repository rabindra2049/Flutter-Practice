import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_project_one/model/movieDetails/production_country.dart';

void main() {
  group("ProductionCountry Model Test", () {
    test('fromJson() should create a ProductionCountry object from JSON', () {
      final Map<String, dynamic> productionCountryJson = {
        'iso_3166_1': 'en',
        'name': 'English',
      };
      final productionCountry =
          ProductionCountry.fromJson(productionCountryJson);

      expect(productionCountry, isA<ProductionCountry>());
      expect(productionCountry.iso_3166_1, 'en');
      expect(productionCountry.name, 'English');
    });

    test("Should convert ProductionCountry instance to JSON", () {
      final ProductionCountry productionCountry = ProductionCountry(
        iso_3166_1: 'en',
        name: 'English',
      );

      final json = productionCountry.toJson();
      expect(json, isA<Map<String, dynamic>>());
      expect(json['iso_3166_1'], 'en');
      expect(json['name'], 'English');
    });

    test("Must required filled", () {
      final ProductionCountry productionCountry = ProductionCountry(
        iso_3166_1: 'en',
        name: 'English',
      );
      expect(productionCountry.iso_3166_1, isNotNull);
      expect(productionCountry.name, isNotNull);
    });
  });
}
