import 'package:flutter/material.dart';
import '../models/podcast_episode.dart';
import '../widgets/expandable_podcast_card.dart';

class PodcastCardPage extends StatelessWidget {
  const PodcastCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final episode = PodcastEpisode(
      title: 'The Psychology of Deep Focus',
      description:
          'Discover how elite performers eliminate distractions, enter flow state, and train their minds for long periods of deep work in a noisy digital world.',
      duration: '58 min',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Podcast Card'),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFF2EEFF),
              Color(0xFFFDFDFF),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Text(
                  'Now Playing',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Tap the card to expand the player',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 40),

                ExpandablePodcastCard(
                  episode: episode,
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}