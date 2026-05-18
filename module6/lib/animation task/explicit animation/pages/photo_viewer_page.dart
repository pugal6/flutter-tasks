import 'package:flutter/material.dart';
import '../widgets/fading_photo_card.dart';

class PhotoViewerPage extends StatelessWidget {
  const PhotoViewerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Viewer'),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFEAF3FF),
              Color(0xFFFDFEFF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 40,
            ),
            child: Column(
              children: const [
                Text(
                  'Nature Gallery',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  'Image fades into the screen when opened',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),

                SizedBox(height: 40),

                FadingPhotoCard(),

                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}