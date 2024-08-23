import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/widgets.dart';

class AddGraph extends StatelessWidget {
  const AddGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(),
        ],
      ),
    );
  }
}
