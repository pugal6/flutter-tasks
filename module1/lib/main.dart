import 'package:flutter/material.dart';
import 'package:module1/mini challenges/movie ticket booking/theme/app_theme.dart';
import 'package:module1/mini challenges/movie ticket booking/screens/movie_booking_screen.dart';

void main() {
  runApp(const MovieBookingApp());
}

class MovieBookingApp extends StatelessWidget {
  const MovieBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const MovieBookingScreen(),
    );
  }
}