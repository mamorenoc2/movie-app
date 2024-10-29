
import 'package:go_router/go_router.dart';
import 'package:movie_app/presetation/screens/movies/home_screen.dart';

final AppRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeMoveScreen.name,
      builder: (context, state) => const HomeMoveScreen(),
      )
  ]
);