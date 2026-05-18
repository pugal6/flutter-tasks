import 'package:flutter/material.dart';
import 'package:module6/stream%20task/widgets/project_card.dart';

import '../download_progress/download_progress_screen.dart';
import '../stock_price/stock_price_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0f172a),
      appBar: AppBar(
        title: const Text("Stream Projects"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ProjectCard(
              title: "Live Stock Price",
              subtitle: "Simulated stock updates using Stream",
              icon: Icons.show_chart,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const StockPriceScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            ProjectCard(
              title: "Download Progress",
              subtitle: "Continuous progress updates using Stream",
              icon: Icons.download,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const DownloadProgressScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}