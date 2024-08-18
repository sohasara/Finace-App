import 'package:finance_app/ui/income_page/details.dart';
import 'package:flutter/material.dart';

class DetailesIncome extends StatelessWidget {
  final String? des;
  final String amount;
  final String cat;
  final String time;
  const DetailesIncome({
    super.key,
    required this.amount,
    required this.cat,
    required this.des,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detailes Page',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w700,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Details(text1: 'Amount:', text2: amount),
            Text(des!),
            Text(cat),
            Text(time),
          ],
        ),
      ),
    );
  }
}
