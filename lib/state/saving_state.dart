import 'package:finance_app/database/expense_model/expense_model.dart';
import 'package:finance_app/database/income_model/income_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

final savingsProvider = FutureProvider<double>((ref) async {
  final incomeBox = await Hive.openBox<IncomeModel>('incomeBox');
  final expenseBox = await Hive.openBox<ExpenseModel>('expenseBox');

  double totalIncome =
      incomeBox.values.fold(0.0, (sum, income) => sum + income.amount);
  double totalExpenses =
      expenseBox.values.fold(0.0, (sum, expense) => sum + expense.amount);

  return totalIncome - totalExpenses;
});
