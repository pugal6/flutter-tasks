import 'package:flutter/material.dart';
import '../widgets/device_card.dart';

class SmartHomeScreen extends StatelessWidget {
  const SmartHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text(
          "Smart Home",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.85,
          children: const [
            DeviceCard(
              deviceName: "Living Room Light",
              roomName: "Living Room",
              icon: Icons.lightbulb,
              initialStatus: true,
            ),
            DeviceCard(
              deviceName: "Bedroom Fan",
              roomName: "Bedroom",
              icon: Icons.air,
              initialStatus: false,
            ),
            DeviceCard(
              deviceName: "Air Conditioner",
              roomName: "Office",
              icon: Icons.ac_unit,
              initialStatus: true,
            ),
          ],
        ),
      ),
    );
  }
}