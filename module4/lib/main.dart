import 'package:flutter/material.dart';
import 'package:module4/http%20task/quote_screen.dart';
import 'package:module4/http%20task/server_status_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuoteScreen(),
    );
  }
}