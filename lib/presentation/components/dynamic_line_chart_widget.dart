import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mcs_calculator/presentation/resources/app_resources.dart';
import 'package:provider/provider.dart';
import '../../data/price_point.dart';
import '../../generated/l10n.dart';
import '../../viewmodels/cs_model.dart';

class DynamicLineChartWidget extends StatefulWidget {
  const DynamicLineChartWidget({Key? key}) : super(key: key);

  @override
  State<DynamicLineChartWidget> createState() => _DynamicLineCharWidget();
}

class _DynamicLineCharWidget extends State<DynamicLineChartWidget> {

  final List<Color> gradientColors = const [
    AppColors.contentColorCyan,
    AppColors.contentColorBlue,
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ComputingSystemModel>(builder: (context, model, child) {
      if (model.isReadyToCalculate() && model.isCalculated) {
        return Column(
            children: [
              AspectRatio(
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
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),

                  // Data and its representation //
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      spots: model.graphPoints,
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
                    LineChartBarData(
                      isCurved: true,
                      spots: model.graphInfPoints,
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
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(S.of(context).graphDescription, textAlign: TextAlign.center),
              ),
          ]);
      } else {
        return const Text("");
      }
    });
  }
}
