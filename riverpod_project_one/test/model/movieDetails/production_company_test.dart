import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_project_one/model/movieDetails/production_company.dart';

void main() {
  group("ProductionCompany Model Test", () {
    test('fromJson() should create a ProductionCompany object from JSON', () {
      final Map<String, dynamic> productionCompanyJson = {
        'id': 1,
        'logo_path': '/logo.jpg',
        'name': 'Company Name',
        'origin_country': 'US',
      };
      final productionCompany =
          ProductionCompany.fromJson(productionCompanyJson);

      expect(productionCompany, isA<ProductionCompany>());
      expect(productionCompany.id, 1);
      expect(productionCompany.logo_path, '/logo.jpg');
      expect(productionCompany.name, 'Company Name');
      expect(productionCompany.origin_country, 'US');
    });

    test("Should convert ProductionCompany instance to JSON", () {
      final ProductionCompany productionCompany = ProductionCompany(
        id: 1,
        logo_path: '/logo.jpg',
        name: 'Company Name',
        origin_country: 'US',
      );

      final json = productionCompany.toJson();
      expect(json, isA<Map<String, dynamic>>());
      expect(json['id'], 1);
      expect(json['logo_path'], '/logo.jpg');
      expect(json['name'], 'Company Name');
      expect(json['origin_country'], 'US');
    });

    test("Must required filled", () {
      final ProductionCompany productionCompany = ProductionCompany(
        id: 1,
        logo_path: null,
        name: 'Company Name',
        origin_country: 'US',
      );
      expect(productionCompany.name, isNotNull);
      expect(productionCompany.logo_path, isNull);
    });
  });
}
