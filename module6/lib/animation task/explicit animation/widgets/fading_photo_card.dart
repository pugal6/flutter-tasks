import 'package:flutter/material.dart';

class FadingPhotoCard extends StatefulWidget {
  const FadingPhotoCard({super.key});

  @override
  State<FadingPhotoCard> createState() =>
      _FadingPhotoCardState();
}

class _FadingPhotoCardState
    extends State<FadingPhotoCard>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeIn,
      ),
    );

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: Container(
        width: 320,
        height: 420,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
          image: const DecorationImage(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}