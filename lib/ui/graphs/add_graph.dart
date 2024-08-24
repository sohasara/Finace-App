import 'package:finance_app/state/expense_state/expense_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/income_state.dart/income_provider.dart';

class AddGraph extends ConsumerWidget {
  const AddGraph({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalExpense = ref.watch(expenseNotifierProvider).fold<double>(
          0.0,
          (sum, expense) => sum + expense.amount,
        );
    final totalIncome = ref.watch(incomeNOtifierProvider).fold<double>(
          0.0,
          (sum, income) => sum + income.amount,
        );

    final saving = totalIncome - totalExpense;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            const Text(
              'Graphical Repesentation',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 300,
              width: 400,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      value: totalIncome,
                      title: 'Income',
                      titleStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      showTitle: true,
                      radius: 120,
                      color: Colors.green,
                    ),
                    PieChartSectionData(
                      value: totalExpense,
                      title: 'Expense',
                      titleStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      showTitle: true,
                      radius: 120,
                      color: Colors.red,
                    ),
                    PieChartSectionData(
                      value: saving,
                      title: 'saving',
                      titleStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      showTitle: true,
                      radius: 120,
                      color: Colors.purple[400],
                    ),
                  ],
                ),
              ),
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
