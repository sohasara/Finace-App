import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AddGraph extends StatelessWidget {
  const AddGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            value: 30,
            title: 'Income',
            showTitle: true,
            radius: 90,
            color: Colors.green,
          ),
          PieChartSectionData(
            value: 60,
            title: 'Expense',
            showTitle: true,
            radius: 100,
            color: Colors.red,
          ),
          PieChartSectionData(
            value: 10,
            title: 'saving',
            showTitle: true,
            radius: 85,
            color: Colors.purple,
          ),
        ],
      ),
    );
  }
}
