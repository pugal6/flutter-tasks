// main.dart
import 'package:flutter/material.dart';
import 'package:module6/render%20object%20task/blue_box.dart';
import 'package:module6/render%20object%20task/green_box.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GreenBox(),
              SizedBox(height: 20),
              BlueBox(),
            ],
          ),
        ),
      ),
    );
  }
}