import 'package:finance_app/database/expense_model/expense_model.dart';
import 'package:finance_app/state/expense_state/expense_class.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

final expenseBoxProvider = FutureProvider<Box<ExpenseModel>>((ref) async {
  return await Hive.openBox<ExpenseModel>('expenseBox');
});

final expenseNotifierProvider =
    StateNotifierProvider<ExpenseNotifier, List<ExpenseModel>>((ref) {
  final box = ref.watch(expenseBoxProvider).when(
        data: (data) => data,
        loading: () => null,
        error: (err, stack) => null,
      );

  if (box != null) {
    return ExpenseNotifier(box);
  } else {
    return ExpenseNotifier(null);
  }
});
