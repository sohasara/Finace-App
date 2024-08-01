import 'package:flutter/material.dart';

class TotalIncome extends StatelessWidget {
  const TotalIncome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 350,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFA5D6A7),
            Color(0xFF81C784),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: const Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Text(
            'Total Income',
            style: TextStyle(
              fontSize: 33,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_circle_up,
                size: 45,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '400',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
