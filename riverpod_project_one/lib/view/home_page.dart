import 'package:flutter/material.dart';
import 'package:riverpod_project_one/view/widgets/movie_banner.dart';
import 'package:riverpod_project_one/view/widgets/movie_filter_section.dart';
import 'package:riverpod_project_one/view/widgets/movie_list.dart';
import 'package:riverpod_project_one/view/widgets/movie_tag_widget.dart';
import 'package:riverpod_project_one/view/widgets/theme_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: ThemeAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieFilterSection(),
            MovieBanner(),
            MovieTags(),
            SizedBox(
              height: 20,
            ),
            MovieList(),
          ],
        ),
      ),
    );
  }
}
