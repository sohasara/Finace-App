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
              Colors.pink[200]!,
              Colors.green[200]!,
              //Colors.blue[200]!,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                'Detailes Page',
                style: TextStyle(
                  color: Colors.green[700],
                  fontWeight: FontWeight.w700,
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
