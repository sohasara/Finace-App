import 'package:flutter/material.dart';

class HistorySaaving extends StatelessWidget {
  final String month;
  final double savedAmount;

  const HistorySaaving({
    super.key,
    required this.month,
    required this.savedAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 400,
        height: 65,
        decoration: BoxDecoration(
          border: Border.all(width: .5),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              month,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 20),
            const Text(
              'Saved Amount',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 20),
            Text(
              '\$$savedAmount',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
