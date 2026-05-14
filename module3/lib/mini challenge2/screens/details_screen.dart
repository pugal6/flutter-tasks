import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsScreen extends StatelessWidget {
  final Map<String, String> movie;

  const DetailsScreen({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie['title']!),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              movie['title']!,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            Text(
              movie['genre']!,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'A popular streaming title with exciting story and amazing visuals.',
              style: TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
               onPressed: () {
                context.pop();
              },
                child: const Text(
                  'Back to Home',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}