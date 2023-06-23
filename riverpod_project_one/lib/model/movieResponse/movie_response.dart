import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_project_one/model/movie/movie.dart';

part 'movie_response.freezed.dart';

part 'movie_response.g.dart';

@freezed
class MovieResponse with _$MovieResponse {
  factory MovieResponse({
    int? page,
    List<Movie>? results,
    int? totalPages,
    int? totalResults,
  }) = _MovieResponse;

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);
}
