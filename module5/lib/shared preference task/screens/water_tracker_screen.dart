import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WaterTrackerScreen extends StatefulWidget {
  const WaterTrackerScreen({super.key});

  @override
  State<WaterTrackerScreen> createState() => _WaterTrackerScreenState();
}

class _WaterTrackerScreenState extends State<WaterTrackerScreen> {
  int waterCount = 0;

  @override
  void initState() {
    super.initState();
    loadWaterCount();
  }

  Future<void> loadWaterCount() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      waterCount = prefs.getInt('waterCount') ?? 0;
    });
  }

  Future<void> increaseWater() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      waterCount++;
    });

    await prefs.setInt('waterCount', waterCount);
  }

  Future<void> resetWater() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      waterCount = 0;
    });

    await prefs.setInt('waterCount', waterCount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Tracker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.water_drop,
              size: 100,
              color: Colors.blue,
            ),

            const SizedBox(height: 20),

            const Text(
              'Daily Water Intake',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              '$waterCount Glasses',
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: increaseWater,
              child: const Text('Drink Water'),
            ),

            const SizedBox(height: 15),

            OutlinedButton(
              onPressed: resetWater,
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}