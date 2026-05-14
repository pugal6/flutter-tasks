import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  final List<String> songs = const [
    'Blinding Lights',
    'Perfect',
    'Levitating',
    'Believer',
    'Senorita',
    'Shape of You',
    'Starboy',
    'Happier',
    'Closer',
    'Faded',
    'Peaches',
    'Stay',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: songs.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: const Icon(Icons.music_note),
            title: Text(songs[index]),
            subtitle: const Text('Saved Song'),
            trailing: const Icon(Icons.play_arrow),
          ),
        );
      },
    );
  }
}