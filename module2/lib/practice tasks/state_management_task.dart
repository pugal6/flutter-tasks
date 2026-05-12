
import 'package:flutter/material.dart';

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
      backgroundColor: const Color(0xFFF5F5F5),

      appBar: AppBar(
        title: const Text('Flutter UI Tasks'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: const [
            OrderSummaryCard(),

            SizedBox(height: 24),

            SmartHomeCard(),
          ],
        ),
      ),
    );
  }
}

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),

      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),

              child: Image.network(
                'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const Text(
                    'Nike Running Shoes',

                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Delivery: 18 May 2026',

                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    '₹4,999',

                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,

                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: const Text(
                      'Shipped',

                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SmartHomeCard extends StatefulWidget {
  const SmartHomeCard({super.key});

  @override
  State<SmartHomeCard> createState() => _SmartHomeCardState();
}

class _SmartHomeCardState extends State<SmartHomeCard> {
  bool isLightOn = false;

  void toggleLight() {
    setState(() {
      isLightOn = !isLightOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),

      child: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            Icon(
              Icons.lightbulb,
              size: 70,
              color: isLightOn
                  ? Colors.amber
                  : Colors.grey,
            ),

            const SizedBox(height: 16),

            const Text(
              'Living Room',

              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              isLightOn
                  ? 'Lights ON'
                  : 'Lights OFF',

              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: isLightOn
                    ? Colors.green
                    : Colors.red,
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: toggleLight,

              child: Text(
                isLightOn
                    ? 'Turn OFF'
                    : 'Turn ON',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
