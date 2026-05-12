import 'package:flutter/material.dart';
import 'package:module2/mini challenges/mini challenge1/screens/smart_home_screen.dart';

void main() {
  runApp(const SmartHomeApp());
}

class SmartHomeApp extends StatelessWidget {
  const SmartHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF4F6FA),
      ),
      home: const SmartHomeScreen(),
    );
  }
}