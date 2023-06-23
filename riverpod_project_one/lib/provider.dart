import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_project_one/config_file.dart';
import 'package:riverpod_project_one/model/movie/movie.dart';
import 'package:riverpod_project_one/model/movieResponse/movie_response.dart';
import 'package:riverpod_project_one/movie_type_extension.dart';

final baseUrlProvider = Provider<String>((ref) {
  return ConfigFile.baseUrl;
});

final httpProvider = Provider<http.Client>((ref) {
  return http.Client();
});

final upcomingProvider = FutureProvider<List<Movie>>((ref) async {
  final baseUrl = ref.watch(baseUrlProvider);
  const endpoint = 'movie/upcoming';
  final queryParam = {'api_key': ConfigFile.apiKey};
  final url =
      Uri.parse('$baseUrl$endpoint').replace(queryParameters: queryParam);
  final client = ref.read(httpProvider);
  final response = await client.get(url);
  final responseData = jsonDecode(response.body);
  return MovieResponse.fromJson(responseData).results!;
});

final movieTypeProvider = StateProvider<MoviesType>((ref) {
  return MoviesType.popular;
});

final moviesProvider = FutureProvider<List<Movie>>((ref) async {
  final movieType = ref.watch(movieTypeProvider);
  final baseUrl = ref.watch(baseUrlProvider);
  final endpoint = 'movie/${movieType.value}';
  final queryParam = {'api_key': ConfigFile.apiKey};
  final url =
      Uri.parse('$baseUrl$endpoint').replace(queryParameters: queryParam);
  final client = ref.read(httpProvider);
  final response = await client.get(url);
  final responseData = jsonDecode(response.body);
  return MovieResponse.fromJson(responseData).results!;
});
