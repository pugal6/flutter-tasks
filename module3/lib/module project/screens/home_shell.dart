import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'courses_screen.dart';
import 'assignments_screen.dart';
import 'profile_screen.dart';

class HomeShell extends StatelessWidget {
  final int initialIndex;

  const HomeShell({
    super.key,
    required this.initialIndex,
  });

  @override
  Widget build(BuildContext context) {
    final screens = [
      const CoursesScreen(),
      const AssignmentsScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: screens[initialIndex],

      bottomNavigationBar: NavigationBar(
        selectedIndex: initialIndex,

        onDestinationSelected: (index) {
          if (index == 0) {
            context.goNamed('courses');
          }

          if (index == 1) {
            context.goNamed('assignments');
          }

          if (index == 2) {
            context.goNamed('profile');
          }
        },

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.book),
            label: 'Courses',
          ),
          NavigationDestination(
            icon: Icon(Icons.assignment),
            label: 'Assignments',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}