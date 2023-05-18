import 'dart:math';
import 'package:fl_chart/fl_chart.dart';


List<FlSpot> getRandomPoints() {
  final Random random = Random();
  final output = <FlSpot>[const FlSpot(0, 0)];
  for (var i = 0; i <= 11; i++) {
    output.add(FlSpot(output.last.x + 0.1, random.nextDouble()));
  }

  return output;
}