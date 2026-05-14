import 'package:flutter/material.dart';

import '../widgets/content_card.dart';

class TrendingScreen extends StatelessWidget {
  const TrendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            const Text(
              'Trending Shows',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            ContentCard(
              title: 'Stranger Things',
              genre: 'Mystery Drama',
            ),

            ContentCard(
              title: 'Money Heist',
              genre: 'Crime Thriller',
            ),
          ],
        ),
      ),
    );
  }
}