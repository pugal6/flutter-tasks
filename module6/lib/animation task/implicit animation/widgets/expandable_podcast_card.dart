import 'package:flutter/material.dart';
import '../models/podcast_episode.dart';

class ExpandablePodcastCard extends StatefulWidget {
  final PodcastEpisode episode;

  const ExpandablePodcastCard({
    super.key,
    required this.episode,
  });

  @override
  State<ExpandablePodcastCard> createState() =>
      _ExpandablePodcastCardState();
}

class _ExpandablePodcastCardState
    extends State<ExpandablePodcastCard> {
  bool expanded = false;

  void toggleExpand() {
    setState(() {
      expanded = !expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleExpand,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        width: 340,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF6C4DFF),
              Color(0xFF8B73FF),
            ],
          ),
          borderRadius: BorderRadius.circular(28),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius:
                        BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.headphones,
                    size: 34,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.episode.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        widget.episode.duration,
                        style: const TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedRotation(
                  turns: expanded ? 0.5 : 0,
                  duration:
                      const Duration(milliseconds: 300),
                  child: const Icon(
                    Icons.expand_more,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            AnimatedCrossFade(
              duration:
                  const Duration(milliseconds: 400),
              crossFadeState: expanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              firstChild: const SizedBox.shrink(),
              secondChild: Column(
                children: [
                  const SizedBox(height: 24),
                  Text(
                    widget.episode.description,
                    style: const TextStyle(
                      color: Colors.white,
                      height: 1.5,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 28),
                  const Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.skip_previous,
                        color: Colors.white,
                        size: 30,
                      ),
                      Icon(
                        Icons.play_circle_fill,
                        color: Colors.white,
                        size: 54,
                      ),
                      Icon(
                        Icons.skip_next,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(10),
                    child:
                        const LinearProgressIndicator(
                      value: 0.45,
                      minHeight: 6,
                      backgroundColor:
                          Colors.white24,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}