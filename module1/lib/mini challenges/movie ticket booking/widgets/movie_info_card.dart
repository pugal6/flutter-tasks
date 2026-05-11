import 'package:flutter/material.dart';

class MovieInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const MovieInfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115,

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: const Color(0xFF1F1F1F),

        borderRadius:
            BorderRadius.circular(22),
      ),

      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.orangeAccent,
            size: 30,
          ),

          const SizedBox(height: 10),

          Text(
            title,

            style: const TextStyle(
              color: Colors.white70,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            subtitle,

            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}