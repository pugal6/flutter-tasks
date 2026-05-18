import 'package:flutter/material.dart';
import 'package:module6/stream%20task/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Streams Demo',
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}