
import 'package:go_router/go_router.dart';
import 'package:movie_app/presetation/screens/movies/home_screen.dart';
import 'package:movie_app/presetation/screens/movies/movie_screen.dart';

final AppRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeMoveScreen.name,
      builder: (context, state) => const HomeMoveScreen(),
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.name,
          builder: (context, state) {
            final movieId = state.pathParameters['id'] ?? 'no-id';
            return MovieScreen( movieId: movieId );
          },
        ),
      ]
      )
  ]
);