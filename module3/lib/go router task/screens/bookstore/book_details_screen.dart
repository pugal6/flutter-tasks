import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/book.dart';

class BookDetailsScreen extends StatelessWidget {
  final Book book;

  const BookDetailsScreen({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              book.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              'Author: ${book.author}',
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 20),

            Text(
              book.description,
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            Text(
              '₹${book.price}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            const Spacer(),

            ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Back to Books'),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text('Back to Main Menu'),
            ),
          ],
        ),
      ),
    );
  }
}