// ignore_for_file: unnecessary_null_comparison

import 'package:finance_app/database/expense_model/expense_model.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

// class ExpenseNotifier extends StateNotifier<List<ExpenseModel>> {
//   final Box<ExpenseModel>? _box;
//   ExpenseNotifier(this._box) : super([]) {
//     loadExpenses();
//   }

//   void loadExpenses() {
//     if (_box != null) {
//       state = _box.values.toList();
//     }
//   }

//   void addExpense(
//       double amount, String category, BuildContext context, String time) {
//     if (_box == null) return;

//     final expense =
//         ExpenseModel(amount: amount, category: category, time: time);
//     _box.add(expense);
//     state = [...state, expense];
//   }

//   void removeExpense(int index) {
//     if (_box == null) return;

//     _box.deleteAt(index);
//     state = List.from(state)..removeAt(index);
//   }
// }
class ExpenseNotifier extends StateNotifier<List<ExpenseModel>> {
  final Box<ExpenseModel>? _box;

  ExpenseNotifier(this._box) : super([]) {
    loadExpenses();
  }

  void loadExpenses() {
    if (_box != null) {
      state = _box!.values.toList();
    }
  }

  void addExpense(double amount, String category, String time) {
    if (_box == null) return;

    final expense =
        ExpenseModel(amount: amount, category: category, time: time);
    _box.add(expense);
    state = [...state, expense];
  }

  void removeExpense(int index) {
    if (_box == null) return;

    _box.deleteAt(index);
    state = List.from(state)..removeAt(index);
  }
}
