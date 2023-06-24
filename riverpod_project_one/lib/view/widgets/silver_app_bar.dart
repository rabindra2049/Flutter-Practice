import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:riverpod_project_one/config_file.dart';
import 'package:riverpod_project_one/model/movie/movie.dart';

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final Movie movie;

  MySliverAppBar({required this.expandedHeight, required this.movie});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        Hero(
            tag: movie.id,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        ConfigFile.imageBaseUrl + movie.poster_path,
                      ))),
            )),
        Positioned(
            top: 40,
            left: 16,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: const Icon(
                      IconlyLight.arrow_left,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: const Icon(
                    IconlyLight.heart,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            )),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Opacity(
            opacity: 0.5,
            child: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.black.withOpacity(0.5),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      movie.title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '2022',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      _getDotView(),
                      const Text(
                        'Action',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      _getDotView(),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        '1h 44m',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

Widget _getDotView() {
  return Container(
    height: 5,
    width: 5,
    decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
  );
}
