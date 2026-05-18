import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../utils/constants.dart';

class ProductFormDialog extends StatefulWidget {
  final Product? product;

  const ProductFormDialog({
    super.key,
    this.product,
  });

  @override
  State<ProductFormDialog> createState() => _ProductFormDialogState();
}

class _ProductFormDialogState extends State<ProductFormDialog> {
  late TextEditingController nameController;
  late TextEditingController quantityController;

  String selectedCategory = categories.first;

  @override
  void initState() {
    super.initState();

    nameController =
        TextEditingController(text: widget.product?.name ?? '');

    quantityController = TextEditingController(
      text: widget.product?.quantity.toString() ?? '',
    );

    selectedCategory =
        widget.product?.category ?? categories.first;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.product == null
            ? 'Add Product'
            : 'Edit Product',
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Product Name',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: quantityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantity',
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField(
              value: selectedCategory,
              items: categories.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final product = Product(
              id: widget.product?.id,
              name: nameController.text,
              quantity:
                  int.tryParse(quantityController.text) ?? 0,
              category: selectedCategory,
            );

            Navigator.pop(context, product);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}