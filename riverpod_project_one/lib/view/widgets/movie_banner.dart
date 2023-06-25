import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:riverpod_project_one/config_file.dart';
import 'package:riverpod_project_one/service/provider.dart';

class MovieBanner extends ConsumerWidget {
  const MovieBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                      width: MediaQuery.of(context).size.height * 0.43,
                      margin: const EdgeInsets.only(right: 15),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        image: DecorationImage(
                            image: NetworkImage(ConfigFile.imageBaseUrlCover +
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
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                flex: 5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                        flex: 3,
                                        child: Text(
                                          movie.title,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                          overflow: TextOverflow.ellipsis,
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
                                          movie.vote_average.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
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
  }
}
