import 'package:flutter/material.dart';

import 'theme_screen.dart';
import 'water_tracker_screen.dart';
import '../widgets/task_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SharedPreferences Practice'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TaskCard(
              title: 'Theme Preference App',
              subtitle: 'Save Light/Dark Mode preference',
              icon: Icons.dark_mode,
              screen: const ThemeScreen(),
            ),

            const SizedBox(height: 16),

            TaskCard(
              title: 'Water Tracker App',
              subtitle: 'Track daily water intake',
              icon: Icons.water_drop,
              screen: const WaterTrackerScreen(),
            ),
          ],
        ),
      ),
    );
  }
}