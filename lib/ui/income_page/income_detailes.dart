import 'package:flutter/material.dart';

class DetailesIncome extends StatelessWidget {
  final String? des;
  final String amount;
  final String cat;
  const DetailesIncome({
    super.key,
    required this.amount,
    required this.cat,
    required this.des,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(des!),
          Text(amount),
          Text(cat),
        ],
      ),
    );
  }
}
