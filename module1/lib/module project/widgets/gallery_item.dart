import 'package:flutter/material.dart';

class GalleryItem extends StatelessWidget {
  final String image;

  const GalleryItem({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Image.network(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}