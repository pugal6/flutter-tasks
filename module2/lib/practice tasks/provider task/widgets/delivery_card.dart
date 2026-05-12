import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/delivery_provider.dart';

class DeliveryCard extends StatelessWidget {
  const DeliveryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final deliveryProvider = context.watch<DeliveryProvider>();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Text(
            "Food Delivery Status",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            deliveryProvider.status,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.delivery_dining),
                  const SizedBox(width: 10),
                  Text(
                    "Order Status: ${deliveryProvider.status}",
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              context.read<DeliveryProvider>().changeStatus();
            },
            child: const Text(
              "Update Delivery Status",
            ),
          ),
        ],
      ),
    );
  }
}