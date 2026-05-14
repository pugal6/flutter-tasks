import 'package:flutter/material.dart';

import '../widgets/content_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            const Text(
              'Recommended Movies',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            ContentCard(
              title: 'Interstellar',
              genre: 'Sci-Fi Adventure',
            ),

            ContentCard(
              title: 'Inception',
              genre: 'Mind-Bending Thriller',
            ),
          ],
        ),
      ),
    );
  }
}