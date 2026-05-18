import 'package:flutter/material.dart';
import '../models/product.dart';

class AnimatedProductTile extends StatefulWidget {
  final Product product;

  const AnimatedProductTile({
    super.key,
    required this.product,
  });

  @override
  State<AnimatedProductTile> createState() =>
      _AnimatedProductTileState();
}

class _AnimatedProductTileState
    extends State<AnimatedProductTile> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      width: 220,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isFavorite
            ? Colors.pink.shade50
            : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: isFavorite ? 12 : 6,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(16),
                child: Image.network(
                  widget.product.imageUrl,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: toggleFavorite,
                  child: AnimatedSwitcher(
                    duration:
                        const Duration(milliseconds: 300),
                    transitionBuilder:
                        (child, animation) {
                      return ScaleTransition(
                        scale: animation,
                        child: child,
                      );
                    },
                    child: Icon(
                      isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      key: ValueKey(isFavorite),
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            widget.product.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '₹${widget.product.price}',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}