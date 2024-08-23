import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AddGraph extends StatelessWidget {
  const AddGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 200,
            width: 200,
            child: PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                    value: 30,
                    title: 'Income',
                    showTitle: true,
                    radius: 70,
                    color: Colors.green,
                  ),
                  PieChartSectionData(
                    value: 60,
                    title: 'Expense',
                    showTitle: true,
                    radius: 70,
                    color: Colors.red,
                  ),
                  PieChartSectionData(
                    value: 10,
                    title: 'saving',
                    showTitle: true,
                    radius: 70,
                    color: Colors.purple,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
