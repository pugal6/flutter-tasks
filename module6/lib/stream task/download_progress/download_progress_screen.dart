import 'package:flutter/material.dart';

import 'download_service.dart';

class DownloadProgressScreen extends StatelessWidget {
  const DownloadProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DownloadService service = DownloadService();

    return Scaffold(
      backgroundColor: const Color(0xff101820),
      appBar: AppBar(
        title: const Text("Download Progress"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: StreamBuilder<int>(
            stream: service.getProgressStream(),
            initialData: 0,
            builder: (context, snapshot) {
              final progress = snapshot.data ?? 0;

              return Container(
                width: double.infinity,
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      child: Icon(
                        progress == 100
                            ? Icons.check_circle
                            : Icons.download,
                        key: ValueKey(progress == 100),
                        size: 90,
                        color: progress == 100
                            ? Colors.green
                            : Colors.blue,
                      ),
                    ),

                    const SizedBox(height: 24),

                    Text(
                      progress == 100
                          ? "Download Complete"
                          : "Downloading File...",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 30),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: LinearProgressIndicator(
                        value: progress / 100,
                        minHeight: 18,
                      ),
                    ),

                    const SizedBox(height: 24),

                    Text(
                      "$progress%",
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}