import 'package:dice_analysis/model/dice_roll_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

final List<DiceRoll> rolls = [];

class AvgChart extends StatelessWidget {
  const AvgChart({super.key});

  List<DiceRollResults> get diceRolls {
    return [
      DiceRollResults.forCategory(rolls, Category.black),
      DiceRollResults.forCategory(rolls, Category.white),
      DiceRollResults.forCategory(rolls, Category.blue),
      DiceRollResults.forCategory(rolls, Category.red),
      DiceRollResults.forCategory(rolls, Category.yellow),
    ];
  }

  int get maxDataLength {
    int maxLength = 0;
    for (DiceRollResults dice in diceRolls) {
      if (maxLength < dice.rolls.length) {
        maxLength = dice.rolls.length;
      }
    }

    return maxLength;
  }

  @override
  Widget build(BuildContext context) {
    for (DiceRollResults dice in diceRolls) {
      calcuateCurrentAvg(dice);
    }

    return SfCartesianChart(
      title: ChartTitle(
          text: 'Average against number of rolls',
          textStyle: const TextStyle(color: Colors.black54)),
      series: <ChartSeries>[
        LineSeries<DiceRoll, int>(
          dataSource: diceRolls[0].rolls,
          xValueMapper: (roll, counter) => counter,
          yValueMapper: (roll, counter) => roll.currentAvg,
          color: categoryColors[diceRolls[0].category],
        ),
        LineSeries<DiceRoll, int>(
          dataSource: diceRolls[1].rolls,
          xValueMapper: (roll, counter) => counter,
          yValueMapper: (roll, counter) => roll.currentAvg,
          color: categoryColors[diceRolls[1].category],
        ),
        LineSeries<DiceRoll, int>(
          dataSource: diceRolls[2].rolls,
          xValueMapper: (roll, counter) => counter,
          yValueMapper: (roll, counter) => roll.currentAvg,
          color: categoryColors[diceRolls[2].category],
        ),
        LineSeries<DiceRoll, int>(
          dataSource: diceRolls[3].rolls,
          xValueMapper: (roll, counter) => counter,
          yValueMapper: (roll, counter) => roll.currentAvg,
          color: categoryColors[diceRolls[3].category],
        ),
        LineSeries<DiceRoll, int>(
          dataSource: diceRolls[4].rolls,
          xValueMapper: (roll, counter) => counter,
          yValueMapper: (roll, counter) => roll.currentAvg,
          color: categoryColors[diceRolls[4].category],
        ),
      ],
      primaryXAxis: NumericAxis(
        visibleMinimum: 1,
        visibleMaximum: maxDataLength <= 5 ? 5 : null,
        desiredIntervals: maxDataLength <= 5 ? 0 : 1,
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
