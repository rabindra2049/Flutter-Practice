import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:riverpod_project_one/config_file.dart';
import 'package:riverpod_project_one/service/provider.dart';

class MovieList extends ConsumerWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final movieList = ref.watch(moviesProvider);
    return movieList.when(
        data: ((movies) => SizedBox(
          height: MediaQuery.of(context).size.height * 0.40,
          child: Swiper(
            itemCount: movies.length,
            viewportFraction: 0.42,
            scale: 0.5,
            itemBuilder: (BuildContext context, int index) {
              final movie = movies[index];
              return InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  onTap: () {
                    ref.read(movieIDProvider.notifier).state = movie.id;
                    context.push("/details", extra: movie);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                      children: [
                        Hero(
                          tag: movie.id,
                          child: Container(
                            height:
                            MediaQuery.of(context).size.height * 0.3,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15)),
                                color: Colors.grey.withOpacity(0.1),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                      ConfigFile.imageBaseUrl +
                                          movie.poster_path,
                                    ))),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                padding: const EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: Colors.grey.withOpacity(0.1),
                                ),
                                child: Text(
                                  movie.adult ? "-18" : "18+",
                                  style: theme.textTheme.bodySmall!
                                      .copyWith(
                                      fontWeight: FontWeight.bold),
                                )),
                            Container(
                                padding: const EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: Colors.grey.withOpacity(0.1),
                                ),
                                child: Text(
                                  'Action',
                                  style: theme.textTheme.bodySmall!
                                      .copyWith(
                                      fontWeight: FontWeight.bold),
                                )),
                            Container(
                                padding: const EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: Colors.grey.withOpacity(0.1),
                                ),
                                child: Row(
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
                                      style: theme.textTheme.bodySmall!
                                          .copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          movie.title,
                          style: theme.textTheme.titleMedium!
                              .copyWith(color: Colors.grey.shade500),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ));
            },
          ),
        )),
        error: ((error, stackTrace) {
          return Text(error.toString());
        }),
        loading: (() {
          return const CircularProgressIndicator();
        }));
  }
}
