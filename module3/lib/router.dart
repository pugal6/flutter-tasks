import 'package:go_router/go_router.dart';
import 'package:module3/go%20router%20task/models/book.dart';
import 'package:module3/go%20router%20task/screens/app_selection_screen.dart';
import 'package:module3/go%20router%20task/screens/auth/dashboard_screen.dart';
import 'package:module3/go%20router%20task/screens/auth/login_screen.dart';
import 'package:module3/go%20router%20task/screens/bookstore/book_details_screen.dart';
import 'package:module3/go%20router%20task/screens/bookstore/home_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const AppSelectionScreen(),
    ),

    // Bookstore Routes
    GoRoute(
      path: '/books',
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/book-details',
      builder: (context, state) {
        final book = state.extra as Book;

        return BookDetailsScreen(book: book);
      },
    ),

    // Auth Routes
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),

    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardScreen(),
    ),
  ],
);