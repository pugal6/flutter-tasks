import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ServerStatusScreen extends StatefulWidget {
  const ServerStatusScreen({super.key});

  @override
  State<ServerStatusScreen> createState() =>
      _ServerStatusScreenState();
}

class _ServerStatusScreenState extends State<ServerStatusScreen> {
  @override
  void initState() {
    super.initState();
    checkServer();
  }

  Future<void> checkServer() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
    );

    print('Status Code: ${response.statusCode}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Server Status'),
      ),
      body: const Center(
        child: Text(
          'Checking Connection...',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}