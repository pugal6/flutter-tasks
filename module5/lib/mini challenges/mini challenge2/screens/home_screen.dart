import 'package:flutter/material.dart';

import '../models/expense_model.dart';
import '../services/firestore_service.dart';
import '../widgets/expense_card.dart';
import '../widgets/expense_input_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) {
              return ExpenseInputDialog(
                onSave: (title, amount, category) {
                  firestoreService.addExpense(
                    ExpenseModel(
                      id: '',
                      title: title,
                      amount: amount,
                      category: category,
                      date: DateTime.now(),
                    ),
                  );
                },
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<List<ExpenseModel>>(
        stream: firestoreService.getExpenses(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final expenses = snapshot.data!;

          double total = 0;

          for (var expense in expenses) {
            total += expense.amount;
          }

          return Column(
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.indigo,
                      Colors.indigo.shade300,
                    ],
                  ),
                  borderRadius:
                      BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Total Spending',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '₹${total.toStringAsFixed(0)}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: expenses.isEmpty
                    ? const Center(
                        child:
                            Text('No expenses added'),
                      )
                    : ListView.builder(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        itemCount: expenses.length,
                        itemBuilder: (context, index) {
                          final expense =
                              expenses[index];

                          return ExpenseCard(
                            expense: expense,
                            onEdit: () {
                              showDialog(
                                context: context,
                                builder: (_) {
                                  return ExpenseInputDialog(
                                    initialTitle:
                                        expense.title,
                                    initialAmount:
                                        expense.amount,
                                    initialCategory:
                                        expense.category,
                                    onSave: (
                                      title,
                                      amount,
                                      category,
                                    ) {
                                      firestoreService
                                          .updateExpense(
                                        ExpenseModel(
                                          id: expense.id,
                                          title: title,
                                          amount: amount,
                                          category:
                                              category,
                                          date:
                                              expense.date,
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                            onDelete: () {
                              firestoreService
                                  .deleteExpense(
                                expense.id,
                              );
                            },
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}