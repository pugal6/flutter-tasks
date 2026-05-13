import 'package:flutter/material.dart';

import '../models/song.dart';

class PlayerScreen extends StatelessWidget {
  final Song song;

  const PlayerScreen({
    super.key,
    required this.song,
  });

  Widget buildInfoTile(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Now Playing'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Icon(
                Icons.album,
                size: 120,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              song.title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              song.artist,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            buildInfoTile('Album', song.album),
            buildInfoTile('Duration', song.duration),
            buildInfoTile('Genre', song.genre),
          ],
        ),
      ),
    );
  }
}