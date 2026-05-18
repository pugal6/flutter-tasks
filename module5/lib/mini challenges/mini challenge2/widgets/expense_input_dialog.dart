import 'package:flutter/material.dart';

class ExpenseInputDialog extends StatefulWidget {
  final Function(String, double, String) onSave;

  final String? initialTitle;
  final double? initialAmount;
  final String? initialCategory;

  const ExpenseInputDialog({
    super.key,
    required this.onSave,
    this.initialTitle,
    this.initialAmount,
    this.initialCategory,
  });

  @override
  State<ExpenseInputDialog> createState() => _ExpenseInputDialogState();
}

class _ExpenseInputDialogState extends State<ExpenseInputDialog> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  String category = 'Food';

  final categories = [
    'Food',
    'Travel',
    'Shopping',
    'Bills',
    'Other',
  ];

  @override
  void initState() {
    super.initState();

    titleController.text = widget.initialTitle ?? '';
    amountController.text =
        widget.initialAmount?.toString() ?? '';

    category = widget.initialCategory ?? 'Food';
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Text(
        widget.initialTitle == null
            ? 'Add Expense'
            : 'Edit Expense',
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
          ),
          const SizedBox(height: 14),
          TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Amount',
            ),
          ),
          const SizedBox(height: 14),
          DropdownButtonFormField(
            value: category,
            items: categories.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                category = value!;
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final title = titleController.text.trim();
            final amount =
                double.tryParse(amountController.text);

            if (title.isEmpty || amount == null) return;

            widget.onSave(
              title,
              amount,
              category,
            );

            Navigator.pop(context);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}