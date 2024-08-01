import 'package:finance_app/state/expense_state/expense_class.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final expenseNotifierProvider =
    StateNotifierProvider<ExpenseNotifier, List<ExpenseItem>>((ref) {
  return ExpenseNotifier([]);
});
