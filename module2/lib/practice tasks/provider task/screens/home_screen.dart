import 'package:flutter/material.dart';

import '../widgets/weather_card.dart';
import '../widgets/delivery_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Practice"),
      ),
      body: SingleChildScrollView(
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              WeatherCard(),
        
              SizedBox(height: 30),
        
              DeliveryCard(),
            ],
          ),
        ),
      ),
    );
  }
}