import 'package:finance_app/ui/income_page/details.dart';
import 'package:flutter/material.dart';

class DetailesExpense extends StatelessWidget {
  final String? des;
  final String amount;
  final String cat;
  final String time;
  const DetailesExpense({
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
              Colors.red[300]!,
              // Colors.white,
              Colors.white,
              Colors.red[200]!,
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
                  fontSize: 30,
                ),
              ),
              centerTitle: true,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Details(text1: 'Amount:', text2: '$amount tk'),
                  Details(text1: 'Category:', text2: cat),
                  Details(text1: 'Time:', text2: time),
                  const SizedBox(
                    height: 10,
                  ),
                  DescriptionP(text1: 'Description:', text2: des!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
