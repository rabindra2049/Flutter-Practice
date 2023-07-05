import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project_one/service/provider.dart';
import 'package:riverpod_project_one/view/widgets/movie_list_details.dart';

class MovieList extends ConsumerWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final movieList = ref.watch(moviesProvider);
    return movieList.when(
        data: ((movies) => MovieListDetails(movies: movies)),
        error: ((error, stackTrace) {
          return Text(error.toString());
        }),
        loading: (() {
          return const CircularProgressIndicator();
        }));
  }
}
