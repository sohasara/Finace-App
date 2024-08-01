import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpenseItem {
  final String amount;
  final String category;

  ExpenseItem({
    required this.amount,
    required this.category,
  });
}

class ExpenseNotifier extends StateNotifier<List<ExpenseItem>> {
  ExpenseNotifier(super.state);
  void addExpense(String amount, String category, BuildContext context) {
    state = [...state, ExpenseItem(amount: amount, category: category)];
  }

  void removeExpense(int index) {
    state = List.from(state)..removeAt(index);
  }
}
