import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:riverpod_project_one/model/movie/movie.dart';
import 'package:riverpod_project_one/model/movieDetails/movie_details.dart';
import 'package:riverpod_project_one/service/provider.dart';
import 'package:riverpod_project_one/view/widgets/cast_list.dart';
import 'package:riverpod_project_one/view/widgets/recommended_movie.dart';
import 'package:riverpod_project_one/view/widgets/silver_app_bar.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: MySliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height * 0.5,
                movie: movie),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Consumer(builder: (context, ref, child) {
                final movieDetails = ref.watch(moviesDetailsProvider);
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      movieDetails.when(
                          data: (data) =>
                              _buildMovieDetailsContent(context, data),
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
              })
            ]),
          ),
        ],
      ),
    );
  }
}

Widget _buildMovieDetailsContent(BuildContext context, MovieDetails movie) {
  print(movie.toString());
  final theme = Theme.of(context);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movie.adult ? "-18" : "18+",
            style: theme.textTheme.titleSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              const Icon(
                IconlyLight.star,
                size: 18,
                color: Colors.yellow,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                movie.vote_average.toString(),
                style: theme.textTheme.titleSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            width: 160,
          ),
          InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              onTap: () {},
              child: const Icon(Icons.share)),
          InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              onTap: () {},
              child: const Icon(Icons.bookmark_outline)),
        ],
      ),
      const SizedBox(height: 16,),
      Text(movie.tagline, style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.grey.shade400, fontSize: 12),),
      const SizedBox(height: 16,),
      Text('Overview', style: Theme.of(context).textTheme.titleLarge),
      const SizedBox(height: 12,),
      Text(movie.overview, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black.withOpacity(0.64), fontSize: 12),),

    ],
  );
}
