import 'package:flutter/material.dart';
import 'package:module4/caching%20and%20error%20handling%20task/connection_retry_screen.dart';
import 'package:module4/caching%20and%20error%20handling%20task/saved_message_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainMenuScreen(),
    );
  }
}

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Practice Tasks'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SavedMessageScreen(),
                  ),
                );
              },
              child: const Text('Saved Message Screen'),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ConnectionRetryScreen(),
                  ),
                );
              },
              child: const Text('Connection Retry App'),
            ),
          ],
        ),
      ),
    );
  }
}