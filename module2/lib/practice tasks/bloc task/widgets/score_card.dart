import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  final int homeScore;
  final int awayScore;

  final VoidCallback onHomeGoal;
  final VoidCallback onAwayGoal;

  const ScoreCard({
    super.key,
    required this.homeScore,
    required this.awayScore,
    required this.onHomeGoal,
    required this.onAwayGoal,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Football Live Score",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Barcelona vs Madrid",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "$homeScore : $awayScore",
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: onHomeGoal,
                  child: const Text("Goal Barcelona"),
                ),
                ElevatedButton(
                  onPressed: onAwayGoal,
                  child: const Text("Goal Madrid"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}