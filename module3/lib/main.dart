import 'package:flutter/material.dart';
import 'package:module3/tab%20navigation%20task/task2/screens/finance_home_screen.dart';

void main() {
  runApp(const FinanceApp());
}

class FinanceApp extends StatelessWidget {
  const FinanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FinanceHomeScreen(),
    );
  }
}