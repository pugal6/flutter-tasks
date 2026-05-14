
import 'package:go_router/go_router.dart';
import 'package:module3/mini%20challenge2/screens/details_screen.dart';
import 'package:module3/mini%20challenge2/screens/home_screen.dart';
import 'package:module3/mini%20challenge2/screens/main_navigation_screen.dart';
import 'package:module3/mini%20challenge2/screens/profile_screen.dart';
import 'package:module3/mini%20challenge2/screens/trending_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainNavigationScreen(
          navigationShell: navigationShell,
        );
      },

      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) {
                return const HomeScreen();
              },
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/trending',
              builder: (context, state) {
                return const TrendingScreen();
              },
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) {
                return const ProfileScreen();
              },
            ),
          ],
        ),
      ],
    ),

    GoRoute(
      path: '/details',
      builder: (context, state) {
        final movie =
            state.extra as Map<String, String>;

        return DetailsScreen(movie: movie);
      },
    ),
  ],
);