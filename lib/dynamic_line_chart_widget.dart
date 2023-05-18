import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mcs_calculator/presentation/resources/app_resources.dart';

import 'data/price_point.dart';

class DynamicLineChartWidget extends StatefulWidget {
  const DynamicLineChartWidget({Key? key}) : super(key: key);

  @override
  State<DynamicLineChartWidget> createState() => _DynamicLineCharWidget();
}

class _DynamicLineCharWidget extends State<DynamicLineChartWidget> {
  List<FlSpot> placePoints = getRandomPoints();

  void _updateData() {
    setState(() {
      placePoints.clear();
      placePoints = getRandomPoints();
    });
  }

  final List<Color> gradientColors = const [
    AppColors.contentColorCyan,
    AppColors.contentColorBlue,
  ];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(LineChartData(

          // Grid visibility //
          gridData: FlGridData(
            show: false,
          ),

          // Border visibility //
          borderData: FlBorderData(
            show: true,
            border: const Border(
              left: BorderSide(),
              bottom: BorderSide(),
            ),
          ),

          // Titles visibility //
          titlesData: FlTitlesData(
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),

          // Data and its representation //
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              spots: placePoints,
              dotData: FlDotData(
                show: false,
              ),
              barWidth: 2,

              isStrokeCapRound: true,

              // Smooth gradient below //
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: gradientColors
                      .map((color) => color.withOpacity(0.3))
                      .toList(),
                ),
              ),
            ),
          ])),
    );
  }
}
