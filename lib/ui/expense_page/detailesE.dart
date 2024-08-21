// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DetailsEx extends StatelessWidget {
  final String text1;
  final String text2;
  const DetailsEx({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(15),
        height: 65,
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(width: 0.3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              text1,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 17,
            ),
            Text(
              text2,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DescriptionP extends StatelessWidget {
  final String text1;
  final String text2;
  const DescriptionP({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 400,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(width: 0.3),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text1,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 17,
          ),
          Text(
            text2,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
