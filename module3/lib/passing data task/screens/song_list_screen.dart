import 'package:flutter/material.dart';

import '../models/song.dart';
import 'player_screen.dart';

class SongListScreen extends StatelessWidget {
  const SongListScreen({super.key});

  final List<Song> songs = const [
    Song(
      title: 'Blinding Lights',
      artist: 'The Weeknd',
      album: 'After Hours',
      duration: '3:20',
      genre: 'Synth Pop',
    ),
    Song(
      title: 'Believer',
      artist: 'Imagine Dragons',
      album: 'Evolve',
      duration: '3:24',
      genre: 'Rock',
    ),
    Song(
      title: 'Perfect',
      artist: 'Ed Sheeran',
      album: 'Divide',
      duration: '4:23',
      genre: 'Pop',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music App'),
      ),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          final song = songs[index];

          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: const Icon(Icons.music_note),
              title: Text(song.title),
              subtitle: Text(song.artist),
              trailing: const Icon(Icons.play_arrow),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PlayerScreen(song: song),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}