import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_project_one/config_file.dart';
import 'package:riverpod_project_one/model/cast/cast.dart';
import 'package:riverpod_project_one/model/movie/movie.dart';
import 'package:riverpod_project_one/model/movieDetails/movie_details.dart';
import 'package:riverpod_project_one/model/movieResponse/movie_response.dart';
import 'package:riverpod_project_one/movie_type_extension.dart';

class ApiService {
  final http.Client client;
  final String baseUrl;

  ApiService(this.client, this.baseUrl);

  Future<List<Movie>> getUpComingMovies() async {
    const headers = {'Content-Type': 'application/json'};
    const endpoint = 'movie/upcoming';
    final queryParam = {'api_key': ConfigFile.apiKey};
    final url =
        Uri.parse('$baseUrl$endpoint').replace(queryParameters: queryParam);

    final response = await client.get(url, headers: headers);

    try {
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return MovieResponse.fromJson(responseData).results!;
      } else {
        throw Exception(
            'Failed to fetch upcoming movies. Status code: ${response.statusCode}');
      }
    } catch (e) {
      //print('Error fetching upcoming movies: $e');
      throw Exception('Failed to fetch upcoming movies. Error: $e');
    }
  }

  Future<List<Movie>> getMoviesByType(MoviesType movieType) async {
    final endpoint = 'movie/${movieType.value}';
    final queryParam = {'api_key': ConfigFile.apiKey};
    final url =
        Uri.parse('$baseUrl$endpoint').replace(queryParameters: queryParam);
    final response = await client.get(url);
    final responseData = jsonDecode(response.body);
    return MovieResponse.fromJson(responseData).results!;
  }

  Future<MovieDetails> getMovieDetails(int movieID) async {
    final endpoint = 'movie/${movieID.toString()}';
    final queryParam = {'api_key': ConfigFile.apiKey};
    final url =
        Uri.parse('$baseUrl$endpoint').replace(queryParameters: queryParam);
    final response = await client.get(url);
    final responseData = jsonDecode(response.body);
    return MovieDetails.fromJson(responseData);
  }

  Future<Cast> getMovieCast(int movieID) async {
    final endpoint = 'movie/${movieID.toString()}/credits';
    final queryParam = {'api_key': ConfigFile.apiKey};
    final url =
        Uri.parse('$baseUrl$endpoint').replace(queryParameters: queryParam);
    final response = await client.get(url);
    final responseData = jsonDecode(response.body);
    return Cast.fromJson(responseData);
  }
}
