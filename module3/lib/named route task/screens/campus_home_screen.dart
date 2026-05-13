import 'package:flutter/material.dart';

class CampusHomeScreen extends StatelessWidget {
  const CampusHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/library');
              },
              child: const Text('Go to Library'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cafeteria');
              },
              child: const Text('Go to Cafeteria'),
            ),
          ],
        ),
      ),
    );
  }
}