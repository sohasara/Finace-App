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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green[300]!,
              Colors.green[100]!,
              Colors.white,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              title: const Text(
                'Detailes Page',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              centerTitle: true,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Details(text1: 'Amount:', text2: amount),
                  Details(text1: 'Category:', text2: cat),
                  Details(text1: 'Time:', text2: time),
                  Details(text1: 'Description:', text2: des!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
