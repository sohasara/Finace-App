import 'package:flutter/material.dart';

class ShowExpense extends StatelessWidget {
  final String amount;
  final String date;
  final String cat;

  const ShowExpense({
    super.key,
    required this.amount,
    required this.cat,
    required this.date,
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
          borderRadius: BorderRadius.circular(
            22,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '\$ $amount ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.pink[900],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              cat,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.pink[900],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              date,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.pink[900],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
