import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  bool isLoading = false;

  Future<void> fetchQuote() async {
    setState(() {
      isLoading = true;
    });

    final response = await http.get(
  Uri.parse('https://dummyjson.com/quotes/random'),
);

final data = jsonDecode(response.body);

    print(data['quote']);


    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quote Request'),
      ),
      body: Center(
        child: isLoading
            ? const Text('Loading Quote...')
            : ElevatedButton(
                onPressed: fetchQuote,
                child: const Text('Get Quote'),
              ),
      ),
    );
  }
}