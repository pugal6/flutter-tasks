import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/book.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final books = [
      Book(
        title: 'Atomic Habits',
        author: 'James Clear',
        description:
            'A practical guide for building good habits and breaking bad ones.',
        price: 499,
      ),
      Book(
        title: 'Clean Code',
        author: 'Robert C. Martin',
        description:
            'A handbook of agile software craftsmanship.',
        price: 699,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
  title: const Text('Bookstore'),
),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];

                return Card(
                  margin: const EdgeInsets.all(12),
                  child: ListTile(
                    title: Text(book.title),
                    subtitle: Text(book.author),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      context.push(
                        '/book-details',
                        extra: book,
                      );
                    },
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 10),

          ElevatedButton(
            onPressed: () {
              context.go('/');
            },
            child: const Text('Back to Main Menu'),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}