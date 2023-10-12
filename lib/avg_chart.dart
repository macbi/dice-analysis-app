import 'package:dice_analysis/model/dice_roll_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

List<DiceRoll> chartData = [];

class AvgChart extends StatelessWidget {
  const AvgChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      title: ChartTitle(
          text: 'Average against number of rolls',
          textStyle: const TextStyle(color: Colors.black54)),
      series: <ChartSeries>[
        LineSeries<DiceRoll, int>(
          dataSource: chartData,
          xValueMapper: (roll, counter) => counter,
          yValueMapper: (roll, counter) => roll.currentAvg,
          color: Colors.amber,
        ),
      ],
      primaryXAxis: NumericAxis(
        visibleMaximum: chartData.length <= 5 ? 5 : null,
        desiredIntervals: chartData.length <= 5 ? 0 : 1,
        labelStyle: const TextStyle(color: Colors.black54),
        title: AxisTitle(
          text: "Number of rolls",
          textStyle: const TextStyle(color: Colors.black54),
        ),
      ),
      primaryYAxis: NumericAxis(
        plotBands: <PlotBand>[
          PlotBand(
              start: 3.5, end: 3.5, borderWidth: 2, borderColor: Colors.black45)
        ],
        interval: 1,
        maximum: 6,
        minimum: 1,
        labelStyle: const TextStyle(color: Colors.black54),
      ),
      backgroundColor: Colors.transparent,
      plotAreaBackgroundColor: Colors.transparent,
    );
  }
}
