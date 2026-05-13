import 'package:flutter/material.dart';

class NotesHomeScreen extends StatelessWidget {
  const NotesHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/saved-notes');
              },
              child: const Text('Open Saved Notes'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/unknown-page');
              },
              child: const Text('Open Unknown Route'),
            ),
          ],
        ),
      ),
    );
  }
}