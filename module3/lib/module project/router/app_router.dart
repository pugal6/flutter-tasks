import 'package:go_router/go_router.dart';

import '../screens/home_shell.dart';
import '../screens/course_detail_screen.dart';
import '../screens/assignment_detail_screen.dart';
import '../screens/not_found_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/courses',

  errorBuilder: (context, state) {
    return const NotFoundScreen();
  },

  routes: [
    GoRoute(
      path: '/courses',
      name: 'courses',
      builder: (context, state) {
        return const HomeShell(initialIndex: 0);
      },
    ),

    GoRoute(
      path: '/assignments',
      name: 'assignments',
      builder: (context, state) {
        return const HomeShell(initialIndex: 1);
      },
    ),

    GoRoute(
      path: '/profile',
      name: 'profile',
      builder: (context, state) {
        return const HomeShell(initialIndex: 2);
      },
    ),

    GoRoute(
      path: '/course/:id',
      name: 'course-detail',
      builder: (context, state) {
        return CourseDetailScreen(
          courseId: state.pathParameters['id']!,
        );
      },
    ),

    GoRoute(
      path: '/assignment/:id',
      name: 'assignment-detail',
      builder: (context, state) {
        return AssignmentDetailScreen(
          assignmentId: state.pathParameters['id']!,
        );
      },
    ),
  ],
);