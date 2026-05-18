import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/animated_product_tile.dart';

class ShoppingTilePage extends StatelessWidget {
  const ShoppingTilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      Product(
        name: 'Nike Air Max',
        price: 4999,
        imageUrl:
            'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
      ),
      Product(
        name: 'Adidas Ultraboost',
        price: 6999,
        imageUrl:
            'https://images.unsplash.com/photo-1600185365483-26d7a4cc7519',
      ),
      Product(
        name: 'Puma RS-X',
        price: 5499,
        imageUrl:
            'https://images.unsplash.com/photo-1608231387042-66d1773070a5',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Tile'),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 94, 72, 222),
              Color(0xFFFDFBFF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 30,
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              const Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Trending Sneakers',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Tap the heart to add products to your wishlist',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 35),

              Expanded(
                child: ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return AnimatedProductTile(
                      product: products[index],
                    );
                  },
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: 20),
                  itemCount: products.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}