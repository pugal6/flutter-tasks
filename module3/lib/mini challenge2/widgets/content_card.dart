import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ContentCard extends StatelessWidget {
  final String title;
  final String genre;

  const ContentCard({
    super.key,
    required this.title,
    required this.genre,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),

      child: ListTile(
        leading: const Icon(
          Icons.movie,
          size: 40,
        ),

        title: Text(title),

        subtitle: Text(genre),

        trailing: const Icon(Icons.arrow_forward),

        onTap: () {
          context.push(
            '/details',
            extra: {
              'title': title,
              'genre': genre,
            },
          );
        },
      ),
    );
  }
}