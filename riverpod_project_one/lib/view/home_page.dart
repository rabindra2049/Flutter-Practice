import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:riverpod_project_one/config_file.dart';
import 'package:riverpod_project_one/service/provider.dart';
import 'package:riverpod_project_one/view/widgets/movie_tag_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.withOpacity(0.01),
        leading: IconButton(
          icon: const Icon(IconlyLight.category),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(IconlyLight.notification),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(IconlyLight.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search movies, series...',
                        filled: true,
                        fillColor: Colors.grey.shade50,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        isDense: true,
                        prefixIcon: const Icon(IconlyLight.search),
                      ),
                      style: theme.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.8)),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 54,
                    width: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade50,
                    ),
                    child: IconButton(
                      icon: const Icon(IconlyLight.filter),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            Consumer(builder: ((context, ref, child) {
              final upComingMovie = ref.watch(upcomingProvider);
              return upComingMovie.when(
                  data: (movies) => SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: double.infinity,
                        child: ListView.builder(
                            padding: const EdgeInsets.all(16),
                            scrollDirection: Axis.horizontal,
                            itemCount: movies.length,
                            itemBuilder: (context, index) {
                              final movie = movies[index];
                              return Container(
                                width:
                                    MediaQuery.of(context).size.height * 0.43,
                                margin: const EdgeInsets.only(right: 15),
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30)),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          ConfigFile.imageBaseUrlCover +
                                              movie.backdrop_path!),
                                      fit: BoxFit.fill),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      blurRadius: 1,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: const BoxDecoration(
                                      // color: Colors.black.withOpacity(0.5),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          flex: 5,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Flexible(
                                                  flex: 3,
                                                  child: Text(
                                                    movie.title,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  )),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
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
                                                    movie.vote_average
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )),
                                      Container(
                                          decoration: BoxDecoration(
                                              color: Colors.red.shade900,
                                              shape: BoxShape.circle),
                                          child: const Icon(
                                            IconlyLight.play,
                                            size: 40,
                                          ))
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                  error: ((error, stackTrace) {
                    debugPrintStack(stackTrace: stackTrace);
                    return Text(error.toString());
                  }),
                  loading: () {
                    return const Center(child: CircularProgressIndicator());
                  });
            })),
            const MovieTags(),
            const SizedBox(
              height: 20,
            ),
            const MovieList(),
          ],
        ),
      ),
    );
  }
}

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
