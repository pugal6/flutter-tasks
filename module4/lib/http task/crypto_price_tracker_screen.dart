import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CryptoPriceTrackerScreen
    extends StatefulWidget {
  const CryptoPriceTrackerScreen({
    super.key,
  });

  @override
  State<CryptoPriceTrackerScreen>
      createState() =>
          _CryptoPriceTrackerScreenState();
}

class _CryptoPriceTrackerScreenState
    extends State<CryptoPriceTrackerScreen> {
  String price = "Press refresh";
  bool isLoading = false;

  Future<void> fetchPrice() async {
    setState(() {
      isLoading = true;
    });

    var url = Uri.parse(
      'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd',
    );

    var response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(response.body);

      setState(() {
        price =
            "\$${data['bitcoin']['usd']}";
      });
    } else {
      setState(() {
        price = "Failed to load price";
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Crypto Price Tracker",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              const Text(
                "Bitcoin Price",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                isLoading ? "Loading..." : price,
                style: const TextStyle(
                  fontSize: 32,
                ),
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: fetchPrice,
                child: const Text("Refresh"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}