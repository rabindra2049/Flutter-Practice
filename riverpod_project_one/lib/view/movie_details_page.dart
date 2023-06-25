import 'package:flutter/material.dart';
import 'package:riverpod_project_one/model/movie/movie.dart';
import 'package:riverpod_project_one/view/widgets/movie_details_content.dart';
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
              const MovieDetailsContent(),
            ]),
          ),
        ],
      ),
    );
  }
}
