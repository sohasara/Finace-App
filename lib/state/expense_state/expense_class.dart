// ignore_for_file: unnecessary_null_comparison

import 'package:finance_app/database/expense_model/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

// class ExpenseItem {
//   final String amount;
//   final String category;

//   ExpenseItem({
//     required this.amount,
//     required this.category,
//   });
// }

// class ExpenseNotifier extends StateNotifier<List<ExpenseItem>> {
//   ExpenseNotifier(super.state);
//   void addExpense(String amount, String category, BuildContext context) {
//     state = [...state, ExpenseItem(amount: amount, category: category)];
//   }

//   void removeExpense(int index) {
//     state = List.from(state)..removeAt(index);
//   }
// }

class ExpenseNotifier extends StateNotifier<List<ExpenseModel>> {
  final Box<ExpenseModel>? _box;
  ExpenseNotifier(this._box) : super([]);

  void addExpense(double amount, String category, BuildContext context) {
    if (_box == null) {
      return;
    } else {
      final expense = ExpenseModel(amount: amount, category: category);
      _box.add(expense);
      state = [...state, expense];
    }
  }
}
