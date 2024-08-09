import 'package:finance_app/state/expense_state/expense_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TotalExpensePage extends ConsumerWidget {
  const TotalExpensePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalExpense = ref.watch(expenseNotifierProvider).fold<double>(
          0.0,
          (sum, expense) => sum + expense.amount,
        );
    return Container(
      height: 220,
      width: 400,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFEF9A9A),
            Color(0xFFFFCDD2),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(children: [
        const SizedBox(
          height: 40,
        ),
        Text(
          'Total Expense',
          style: TextStyle(
            fontSize: 33,
            color: Colors.red[900],
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.arrow_circle_down,
              size: 50,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              totalExpense.toString(),
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ]),
    );
  }
}
