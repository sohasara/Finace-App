import 'package:flutter/material.dart';

class HistorySaaving extends StatelessWidget {
  const HistorySaaving({super.key});

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
          borderRadius: BorderRadius.circular(
            22,
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'June',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              'Saved Amount',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              '3000000',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
