import 'package:comvis/charts/line_titles.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart' ;


class line_chart extends StatelessWidget {
  final List<Color> gradienColor = [
    const Color(0xff23b6e6),
    const Color(0xff23b6e6),
  ];
  
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 6,
          minY: 0,
          maxY: 3,
        titlesData: LineTitles.getTitleData(),
        gridData: FlGridData(
          show: true,
          getDrawingHorizontalLine: (value){
            return FlLine(
              color:Colors.red,
              strokeWidth: 2,
            );
          },
          drawVerticalLine: true,
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Colors.black , width: 2),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(1, 2),
              FlSpot(2, 1),
              FlSpot(3, 1),
              FlSpot(3, 3),


            ],
            isCurved: true,
            barWidth: 5,
          )
        ]
      )
    );
  }
}
