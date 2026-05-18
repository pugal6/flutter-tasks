import 'package:flutter/material.dart';

class RotatingAlbumCover extends StatefulWidget {
  const RotatingAlbumCover({super.key});

  @override
  State<RotatingAlbumCover> createState() =>
      _RotatingAlbumCoverState();
}

class _RotatingAlbumCoverState
    extends State<RotatingAlbumCover>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  bool isPlaying = false;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void toggleMusic() {
    setState(() {
      isPlaying = !isPlaying;
    });

    if (isPlaying) {
      controller.repeat();
    } else {
      controller.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RotationTransition(
          turns: controller,
          child: Container(
            width: 260,
            height: 260,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 20,
                  offset: Offset(0, 8),
                ),
              ],
              image: const DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        const SizedBox(height: 40),

        GestureDetector(
          onTap: toggleMusic,
          child: Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Icon(
              isPlaying
                  ? Icons.pause
                  : Icons.play_arrow,
              size: 36,
            ),
          ),
        ),
      ],
    );
  }
}