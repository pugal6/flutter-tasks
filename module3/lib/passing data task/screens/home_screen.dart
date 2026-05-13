import 'package:flutter/material.dart';

import 'recipe_list_screen.dart';
import 'song_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apps'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SongListScreen(),
                  ),
                );
              },
              child: const Text('Open Music App'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const RecipeListScreen(),
                  ),
                );
              },
              child: const Text('Open Recipe App'),
            ),
          ],
        ),
      ),
    );
  }
}