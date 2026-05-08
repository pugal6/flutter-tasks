// responsive_tasks.dart

import 'package:flutter/material.dart';

class ResponsiveTasks extends StatelessWidget {
  const ResponsiveTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        backgroundColor: Colors.grey.shade200,

        appBar: AppBar(
          title: const Text("Responsive Layout Tasks"),
        ),

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ---------------- TASK 1 ----------------

              const Text(
                "Movie Streaming Layout",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              LayoutBuilder(
                builder: (context, constraints) {

                  bool isWideScreen = constraints.maxWidth > 600;

                  return isWideScreen
                      ? const Row(
                          children: [
                            Expanded(
                              child: MovieCard(
                                title: "Inception",
                                genre: "Sci-Fi • 8.8 IMDB",
                                color: Colors.deepPurple,
                              ),
                            ),

                            SizedBox(width: 16),

                            Expanded(
                              child: MovieCard(
                                title: "Interstellar",
                                genre: "Adventure • 8.7 IMDB",
                                color: Colors.teal,
                              ),
                            ),
                          ],
                        )

                      : const Column(
                          children: [
                            MovieCard(
                              title: "Inception",
                              genre: "Sci-Fi • 8.8 IMDB",
                              color: Colors.deepPurple,
                            ),

                            SizedBox(height: 16),

                            MovieCard(
                              title: "Interstellar",
                              genre: "Adventure • 8.7 IMDB",
                              color: Colors.teal,
                            ),
                          ],
                        );
                },
              ),

              const SizedBox(height: 50),

              // ---------------- TASK 2 ----------------

              const Text(
                "Stats Dashboard",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Row(
                children: [

                  Expanded(
                    flex: 1,
                    child: StatsBox(
                      color: Colors.orange,
                      label: "Users",
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    flex: 2,
                    child: StatsBox(
                      color: Colors.blue,
                      label: "Revenue",
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    flex: 1,
                    child: StatsBox(
                      color: Colors.green,
                      label: "Orders",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final String title;
  final String genre;
  final Color color;

  const MovieCard({
    super.key,
    required this.title,
    required this.genre,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            height: 180,

            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(16),
            ),

            child: const Center(
              child: Icon(
                Icons.movie,
                size: 60,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 16),

          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            genre,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {},

            child: const Text("Watch Now"),
          ),
        ],
      ),
    );
  }
}

class StatsBox extends StatelessWidget {
  final Color color;
  final String label;

  const StatsBox({
    super.key,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,

      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}