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
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        value: totalIncome,
                        title: 'Income',
                        showTitle: true,
                        radius: 70,
                        color: Colors.green,
                      ),
                      PieChartSectionData(
                        value: totalExpense,
                        title: 'Expense',
                        showTitle: true,
                        radius: 70,
                        color: Colors.red,
                      ),
                      PieChartSectionData(
                        value: saving,
                        title: 'saving',
                        showTitle: true,
                        radius: 70,
                        color: Colors.purple,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  color: Colors.purple[100],
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    const Text('saved amount'),
                    Text(saving.toString()),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
