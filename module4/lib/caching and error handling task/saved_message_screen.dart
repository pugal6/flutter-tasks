import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SavedMessageScreen extends StatefulWidget {
  const SavedMessageScreen({super.key});

  @override
  State<SavedMessageScreen> createState() => _SavedMessageScreenState();
}

class _SavedMessageScreenState extends State<SavedMessageScreen> {
  String message = 'Loading...';

  // Stored data
  String? savedMessage;

  @override
  void initState() {
    super.initState();
    fetchMessage();
  }

 Future<void> fetchMessage() async {
  // Artificial delay
  await Future.delayed(const Duration(seconds: 2));

  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
  );

  final data = jsonDecode(response.body);

  setState(() {
    message = data['title'];

    // Save data locally
    savedMessage = data['title'];
  });
}

  void loadStoredMessage() {
  setState(() {
    if (savedMessage != null) {
      message = 'Loaded From Memory:\n\n$savedMessage';
    } else {
      message = 'No saved message found';
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Message'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              message,
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: loadStoredMessage,
              child: const Text('Load Again'),
            ),
          ],
        ),
      ),
    );
  }
}