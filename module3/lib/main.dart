import 'package:flutter/material.dart';
import 'package:module3/navigation%20task/screens/main_menu_screen.dart';


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