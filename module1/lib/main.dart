import 'package:flutter/material.dart';
import 'package:module1/module project/screens/home_screen.dart';

void main() {
  runApp(const LocalConnectApp());
}

class LocalConnectApp extends StatelessWidget {
  const LocalConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LocalConnect',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F7FB),
        primaryColor: const Color(0xFF4F46E5),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4F46E5),
        ),
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}