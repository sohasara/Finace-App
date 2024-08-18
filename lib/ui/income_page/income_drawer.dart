import 'package:flutter/material.dart';

class IncomeDrawer extends StatelessWidget {
  const IncomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Icon(
          Icons.account_circle,
          size: 100,
        ),
        Text(
          'Nadia',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
