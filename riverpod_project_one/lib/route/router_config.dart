import 'package:go_router/go_router.dart';
import 'package:riverpod_project_one/model/movie/movie.dart';
import 'package:riverpod_project_one/view/home_page.dart';
import 'package:riverpod_project_one/view/movie_details_page.dart';

final GoRouter router = GoRouter(initialLocation: "/", routes: [
  GoRoute(path: "/", builder: (context, state) => const HomePage()),
  GoRoute(
      path: "/details",
      builder: (context, state) => MovieDetailsPage(
            movie: state.extra as Movie,
          )),
]);
