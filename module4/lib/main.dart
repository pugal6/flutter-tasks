import 'package:flutter/material.dart';
import 'package:module4/module%20project/screens/home_screen.dart';

void main() {
  runApp(const DailyReaderApp());
}

class DailyReaderApp extends StatelessWidget {
  const DailyReaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DailyReader',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F7FB),
        primaryColor: const Color(0xFF4F46E5),

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          foregroundColor: Colors.black,
        ),

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4F46E5),
        ),

        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}