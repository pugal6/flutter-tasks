import 'package:flutter/material.dart';

class BatteryCard extends StatelessWidget {
  final int batteryLevel;
  final VoidCallback onPressed;

  const BatteryCard({
    super.key,
    required this.batteryLevel,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Battery Status",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Icon(
              Icons.battery_full,
              size: 80,
              color:
                  batteryLevel > 20 ? Colors.green : Colors.red,
            ),

            const SizedBox(height: 10),

            Text(
              "$batteryLevel%",
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: onPressed,
              child: const Text("Change Battery"),
            ),
          ],
        ),
      ),
    );
  }
}