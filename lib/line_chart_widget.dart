import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mcs_calculator/presentation/resources/app_resources.dart';
import 'package:mcs_calculator/data/price_point.dart';

class LineChartWidget extends StatelessWidget {

  final List<FlSpot> placePoints = getRandomPoints();

  final List<Color> gradientColors = const [
    AppColors.contentColorCyan,
    AppColors.contentColorBlue,
  ];

  LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(
        LineChartData(
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
            topTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false
              )
            ),
            rightTitles: AxisTitles(
                sideTitles: SideTitles(
                    showTitles: false
                )
            ),
          ),

          // Data and its representation //
          lineBarsData: [
            LineChartBarData(
              spots: placePoints,
              isCurved: true,
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
          ],
        ),
      ),
    );
  }
}
