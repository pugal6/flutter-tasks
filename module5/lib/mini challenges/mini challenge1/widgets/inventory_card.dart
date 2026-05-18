import 'package:flutter/material.dart';

import '../models/product_model.dart';
import 'quantity_buttons.dart';

class InventoryCard extends StatelessWidget {
  final Product product;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const InventoryCard({
    super.key,
    required this.product,
    required this.onDelete,
    required this.onEdit,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    final bool isLowStock = product.quantity <= 5;

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isLowStock
            ? Colors.red.shade50
            : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isLowStock
              ? Colors.red.shade300
              : Colors.grey.shade200,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.indigo.shade100,
                child: const Icon(Icons.inventory),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(product.category),
                  ],
                ),
              ),
              IconButton(
                onPressed: onEdit,
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: onDelete,
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Stock Quantity',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${product.quantity}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              QuantityButtons(
                onIncrease: onIncrease,
                onDecrease: onDecrease,
              ),
            ],
          ),
          if (isLowStock) ...[
            const SizedBox(height: 12),
            Row(
              children: const [
                Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.red,
                ),
                SizedBox(width: 6),
                Text(
                  'Low Stock',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}