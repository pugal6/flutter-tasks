import 'package:flutter/material.dart';

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({super.key});

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  // Like button variables
  int likeCount = 0;
  bool isLiked = false;

  // Food ordering variables
  int quantity = 0;

  void toggleLike() {
    setState(() {
      if (isLiked) {
        likeCount--;
        isLiked = false;
      } else {
        likeCount++;
        isLiked = true;
      }
    });
  }

  void addItem() {
    setState(() {
      quantity++;
    });
  }

  void removeItem() {
    setState(() {
      if (quantity > 0) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("setState Practice"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Like Button Section
            const Text(
              "Social Media Post",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Learning Flutter is fun 🚀",
                    style: TextStyle(fontSize: 18),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: toggleLike,
                        child: Text(
                          isLiked ? "Unlike" : "Like",
                        ),
                      ),

                      const SizedBox(width: 16),

                      Text(
                        "Likes: $likeCount",
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Food Ordering Section
            const Text(
              "Food Order Widget",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Pizza",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    "Quantity: $quantity",
                    style: const TextStyle(fontSize: 18),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: addItem,
                        child: const Text("Add Item"),
                      ),

                      const SizedBox(width: 12),

                      ElevatedButton(
                        onPressed: removeItem,
                        child: const Text("Remove Item"),
                      ),
                    ],
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