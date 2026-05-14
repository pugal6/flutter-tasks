import 'package:flutter/material.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        ListTile(
          leading: Icon(Icons.shopping_cart),
          title: Text('Groceries'),
          trailing: Text('- \$120'),
        ),
        ListTile(
          leading: Icon(Icons.movie),
          title: Text('Netflix'),
          trailing: Text('- \$15'),
        ),
      ],
    );
  }
}