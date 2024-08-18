import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final String text1;
  final String text2;
  const Details({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text2,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
      ],
    );
  }
}
