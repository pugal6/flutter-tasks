import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        ListTile(
          leading: Icon(Icons.music_note),
          title: Text('Blinding Lights'),
          subtitle: Text('The Weeknd'),
        ),
        ListTile(
          leading: Icon(Icons.music_note),
          title: Text('Perfect'),
          subtitle: Text('Ed Sheeran'),
        ),
      ],
    );
  }
}