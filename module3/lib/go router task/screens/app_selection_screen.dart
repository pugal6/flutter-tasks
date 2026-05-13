import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppSelectionScreen extends StatelessWidget {
  const AppSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GoRouter Practice Apps'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                context.go('/books');
              },
              child: const Text('Open Bookstore App'),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                context.go('/login');
              },
              child: const Text('Open Authentication App'),
            ),
          ],
        ),
      ),
    );
  }
}