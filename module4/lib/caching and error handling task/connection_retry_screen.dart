import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConnectionRetryScreen extends StatefulWidget {
  const ConnectionRetryScreen({super.key});

  @override
  State<ConnectionRetryScreen> createState() =>
      _ConnectionRetryScreenState();
}

class _ConnectionRetryScreenState
    extends State<ConnectionRetryScreen> {
  String result = 'Press the button to fetch data';

  Future<void> fetchData() async {
    setState(() {
      result = 'Loading...';
    });

    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          result = 'Success: ${data['title']}';
        });
      } else {
        setState(() {
          result =
              'Failed Request - Status Code: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        result = 'Unexpected Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connection Retry'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              result,
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: fetchData,
              child: const Text('Try Fetching Data'),
            ),
          ],
        ),
      ),
    );
  }
}