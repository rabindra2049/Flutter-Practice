import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_project_one/model/movieDetails/production_company.dart';
import 'package:riverpod_project_one/model/movieDetails/production_country.dart';
import 'package:riverpod_project_one/model/movieDetails/spoken_language.dart';

import 'genre.dart';

part 'movie_details.freezed.dart';
part 'movie_details.g.dart';

@freezed
class MovieDetails with _$MovieDetails {
  factory MovieDetails({
    required bool adult,
    required String backdrop_path,
    dynamic belongs_to_collection,
    required int budget,
    List<Genre>? genres,
    required String homepage,
    required int id,
    required String imdb_id,
    required String original_language,
    required String original_title,
    required String overview,
    required double popularity,
    required String poster_path,
    required List<ProductionCompany> production_companies,
    required List<ProductionCountry> production_countries,
    required String release_date,
    required int revenue,
    required int runtime,
    required List<SpokenLanguage> spoken_languages,
    required String status,
    required String tagline,
    required String title,
    required bool video,
    required double vote_average,
    required int vote_count
  }) = _MovieDetails;

  factory MovieDetails.fromJson(Map<String, dynamic> json) => _$MovieDetailsFromJson(json);
}