import 'package:flutter/material.dart';
import 'package:module3/tab%20navigation%20task/task2/screens/budget_screen.dart';
import 'package:module3/tab%20navigation%20task/task2/screens/overview_screen.dart';
import 'package:module3/tab%20navigation%20task/task2/screens/transactions_screen.dart';

class FinanceHomeScreen extends StatefulWidget {
  const FinanceHomeScreen({super.key});

  @override
  State<FinanceHomeScreen> createState() =>
      _FinanceHomeScreenState();
}

class _FinanceHomeScreenState
    extends State<FinanceHomeScreen> {
  int currentIndex = 0;

  final List<Widget> screens = const [
    OverviewScreen(),
    TransactionsScreen(),
    BudgetScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finance App'),
      ),
      body: screens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Overview',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Budget',
          ),
        ],
      ),
    );
  }
}