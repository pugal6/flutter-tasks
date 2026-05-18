import 'package:flutter/material.dart';
import 'package:module5/mini%20challenges/mini%20challenge1/screens/inventory_screen.dart';

void main() {
  runApp(const InventoryApp());
}

class InventoryApp extends StatelessWidget {
  const InventoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inventory Tracker',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF5F7FB),
      ),
      home: const InventoryScreen(),
    );
  }
}