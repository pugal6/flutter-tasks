import 'package:flutter/material.dart';

import '../database/inventory_database.dart';
import '../models/product_model.dart';
import '../widgets/empty_inventory.dart';
import '../widgets/inventory_card.dart';
import '../widgets/product_form_dialog.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() =>
      _InventoryScreenState();
}

class _InventoryScreenState
    extends State<InventoryScreen> {
  List<Product> products = [];
  List<Product> filteredProducts = [];

  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    final data =
        await InventoryDatabase.instance.getProducts();

    setState(() {
      products = data;
      filteredProducts = data;
    });
  }

  void searchProducts(String value) {
    final result = products.where((product) {
      return product.name
              .toLowerCase()
              .contains(value.toLowerCase()) ||
          product.category
              .toLowerCase()
              .contains(value.toLowerCase());
    }).toList();

    setState(() {
      filteredProducts = result;
    });
  }

  Future<void> addProduct() async {
    final product = await showDialog<Product>(
      context: context,
      builder: (_) => const ProductFormDialog(),
    );

    if (product != null) {
      await InventoryDatabase.instance
          .insertProduct(product);

      loadProducts();
    }
  }

  Future<void> editProduct(Product oldProduct) async {
    final updatedProduct = await showDialog<Product>(
      context: context,
      builder: (_) =>
          ProductFormDialog(product: oldProduct),
    );

    if (updatedProduct != null) {
      await InventoryDatabase.instance
          .updateProduct(updatedProduct);

      loadProducts();
    }
  }

  Future<void> deleteProduct(int id) async {
    await InventoryDatabase.instance
        .deleteProduct(id);

    loadProducts();
  }

  Future<void> updateQuantity(
    Product product,
    int value,
  ) async {
    final updated = product.copyWith(
      quantity: (product.quantity + value).clamp(0, 999),
    );

    await InventoryDatabase.instance
        .updateProduct(updated);

    loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory Tracker'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addProduct,
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              onChanged: searchProducts,
              decoration: InputDecoration(
                hintText: 'Search products...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: filteredProducts.isEmpty
                  ? const EmptyInventory()
                  : ListView.builder(
                      itemCount:
                          filteredProducts.length,
                      itemBuilder: (context, index) {
                        final product =
                            filteredProducts[index];

                        return InventoryCard(
                          product: product,
                          onDelete: () {
                            deleteProduct(
                              product.id!,
                            );
                          },
                          onEdit: () {
                            editProduct(product);
                          },
                          onIncrease: () {
                            updateQuantity(
                              product,
                              1,
                            );
                          },
                          onDecrease: () {
                            updateQuantity(
                              product,
                              -1,
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}