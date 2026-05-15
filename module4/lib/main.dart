
import 'package:flutter/material.dart';
import 'package:module4/http%20task/crypto_price_tracker_screen.dart';
import 'package:module4/http%20task/quote_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Practice Apps"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const QuoteOfTheDayScreen(),
                  ),
                );
              },
              child: const Text(
                "Quote of the Day",
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const CryptoPriceTrackerScreen(),
                  ),
                );
              },
              child: const Text(
                "Crypto Price Tracker",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
