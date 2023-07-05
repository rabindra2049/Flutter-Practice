import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project_one/service/provider.dart';
import 'package:riverpod_project_one/view/widgets/movie_banner_details.dart';

class MovieBanner extends ConsumerWidget {
  const MovieBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final upComingMovie = ref.watch(upcomingProvider);
    return upComingMovie.when(
        data: (movies) => MovieBannerDetails(movies: movies),
        error: ((error, stackTrace) {
          return Text(error.toString());
        }),
        loading: () {
          return const Center(child: CircularProgressIndicator());
        });
  }
}
