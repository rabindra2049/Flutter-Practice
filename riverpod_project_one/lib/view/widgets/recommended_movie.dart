import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project_one/service/provider.dart';
import 'package:riverpod_project_one/view/widgets/recommended_movie_list.dart';

class RecommendedWidget extends ConsumerWidget {
  const RecommendedWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final casts = ref.watch(upcomingProvider);
    return casts.when(
        data: (data) => RecommendedMovieList(
              data: data,
            ),
        error: ((error, stackTrace) => Text(error.toString())),
        loading: (() {
          return const CircularProgressIndicator();
        }));
  }
}
