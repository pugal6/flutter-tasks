import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/expense_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final CollectionReference expenses =
      FirebaseFirestore.instance.collection('expenses');

  Stream<List<ExpenseModel>> getExpenses() {
    return expenses
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => ExpenseModel.fromFirestore(doc))
          .toList();
    });
  }

  Future<void> addExpense(ExpenseModel expense) async {
    await expenses.add(expense.toMap());
  }

  Future<void> updateExpense(ExpenseModel expense) async {
    await expenses.doc(expense.id).update(expense.toMap());
  }

  Future<void> deleteExpense(String id) async {
    await expenses.doc(id).delete();
  }
}