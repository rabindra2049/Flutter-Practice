import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_project_one/config_file.dart';
import 'package:riverpod_project_one/model/cast/cast.dart';
import 'package:riverpod_project_one/model/movie/movie.dart';
import 'package:riverpod_project_one/model/movieDetails/movie_details.dart';
import 'package:riverpod_project_one/movie_type_extension.dart';
import 'package:riverpod_project_one/service/api_service.dart';

final baseUrlProvider = Provider<String>((ref) {
  return ConfigFile.baseUrl;
});

final httpProvider = Provider<http.Client>((ref) {
  return http.Client();
});

final apiServiceProvider = Provider<ApiService>((ref) {
  final client = ref.read(httpProvider);
  final baseUrl = ref.watch(baseUrlProvider);
  return ApiService(client, baseUrl);
});

final upcomingProvider = FutureProvider<List<Movie>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getUpComingMovies();
});

final movieTypeProvider = StateProvider<MoviesType>((ref) {
  return MoviesType.popular;
});

final moviesProvider = FutureProvider<List<Movie>>((ref) async {
  final movieType = ref.watch(movieTypeProvider);
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getMoviesByType(movieType);
});

final movieIDProvider = StateProvider<int>((ref) {
  return 0;
});

final moviesDetailsProvider = FutureProvider<MovieDetails>((ref) async {
  final movieID = ref.watch(movieIDProvider);
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getMovieDetails(movieID);
});

final castProvider = FutureProvider<Cast>((ref) async {
  final movieID = ref.watch(movieIDProvider);
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getMovieCast(movieID);
});
