import 'package:flutter/material.dart';

class TotalExpensePage extends StatelessWidget {
  const TotalExpensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 350,
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
      child: Column(
        children: [
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
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_circle_down,
                size: 50,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '400',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
