// ignore_for_file: unnecessary_null_comparison

import 'package:finance_app/database/expense_model/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ExpenseNotifier extends StateNotifier<List<ExpenseModel>> {
  final Box<ExpenseModel>? _box;
  ExpenseNotifier(this._box) : super([]) {
    loadExpenses();
  }

  void loadExpenses() {
    if (_box != null) {
      state = _box.values.toList();
    }
  }

  void addExpense(double amount, String category, BuildContext context) {
    if (_box == null) return;

    final expense = ExpenseModel(amount: amount, category: category);
    _box.add(expense);
    state = [...state, expense];
  }

  void removeExpense(int index) {
    if (_box == null) return;

    _box.deleteAt(index);
    state = List.from(state)..removeAt(index);
  }
}
