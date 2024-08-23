import 'package:finance_app/state/expense_state/expense_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddGraph extends ConsumerWidget {
  const AddGraph({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalExpense = ref.watch(expenseNotifierProvider).fold<double>(
          0.0,
          (sum, expense) => sum + expense.amount,
        );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 200,
            width: 200,
            child: PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                    value: totalExpense,
                    title: 'Income',
                    showTitle: true,
                    radius: 70,
                    color: Colors.green,
                  ),
                  PieChartSectionData(
                    value: 60,
                    title: 'Expense',
                    showTitle: true,
                    radius: 70,
                    color: Colors.red,
                  ),
                  PieChartSectionData(
                    value: 10,
                    title: 'saving',
                    showTitle: true,
                    radius: 70,
                    color: Colors.purple,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
