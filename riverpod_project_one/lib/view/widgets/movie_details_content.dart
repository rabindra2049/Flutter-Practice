import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:riverpod_project_one/config_file.dart';
import 'package:riverpod_project_one/service/provider.dart';
import 'package:riverpod_project_one/view/widgets/cast_list.dart';
import 'package:riverpod_project_one/view/widgets/movie_details.dart';
import 'package:riverpod_project_one/view/widgets/recommended_movie.dart';

class MovieDetailsContent extends ConsumerWidget {
  const MovieDetailsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final movieDetails = ref.watch(moviesDetailsProvider);
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          movieDetails.when(
              data: (data) => MovieDetailsWidget(movie: data),
              error: ((error, stackTrace) =>
                  Text(error.toString())),
              loading: (() {
                return const CircularProgressIndicator();
              })),
          const SizedBox(height: 16),
          Text('Top Bill Cost',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(
            height: 10,
          ),
          const CastList(),
          const SizedBox(
            height: 10,
          ),
          Text('Recommended',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(
            height: 16,
          ),
          const RecommendedWidget()
        ],
      ),
    );
  }
}
