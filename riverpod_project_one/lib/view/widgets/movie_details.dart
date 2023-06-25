import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:riverpod_project_one/model/movieDetails/movie_details.dart';

class MovieDetailsWidget extends StatelessWidget {
  final MovieDetails movie;

  const MovieDetailsWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        const SizedBox(
          height: 16,
        ),
        Text(
          movie.tagline,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Colors.grey.shade400, fontSize: 12),
        ),
        const SizedBox(
          height: 16,
        ),
        Text('Overview', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(
          height: 12,
        ),
        Text(
          movie.overview,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Colors.black.withOpacity(0.64), fontSize: 12),
        ),
      ],
    );
  }
}
