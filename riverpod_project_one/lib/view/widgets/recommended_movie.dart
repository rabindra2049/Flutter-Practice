import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project_one/config_file.dart';
import 'package:riverpod_project_one/model/movie/movie.dart';
import 'package:riverpod_project_one/service/provider.dart';

class RecommendedWidget extends ConsumerWidget {
  const RecommendedWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final casts = ref.watch(upcomingProvider);
    return casts.when(
        data: (data) => _buildRecommendedList(context, data),
        error: ((error, stackTrace) => Text(error.toString())),
        loading: (() {
          return const CircularProgressIndicator();
        }));
  }
}

Widget _buildRecommendedList(BuildContext context, List<Movie> data) {
  final theme = Theme.of(context);
  return SizedBox(
    height: 200,
    child: ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: data.length,
      itemBuilder: (context, index) {
        final movie = data.elementAt(index);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.withOpacity(0.1),
                  image: DecorationImage(
                    image: NetworkImage(
                      '${ConfigFile.imageBaseUrl}${movie.poster_path}',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: 100,
                child: Text(
                  movie.title,
                  style: theme.textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
