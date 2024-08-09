import 'package:finance_app/state/income_state.dart/income_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TotalIncome extends ConsumerWidget {
  const TotalIncome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalIncome = ref.watch(incomeNOtifierProvider).fold<double>(
          0.0,
          (sum, income) => sum + income.amount,
        );
    return Container(
      height: 220,
      width: 350,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFA5D6A7),
            Color(0xFF81C784),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Total Income',
            style: TextStyle(
              fontSize: 33,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.arrow_circle_up,
                size: 45,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                totalIncome.toString(),
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
