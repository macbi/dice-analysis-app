import 'package:dice_analysis/avg_chart.dart';
import 'package:dice_analysis/model/dice_roll_model.dart';
import 'package:dice_analysis/dice_roller.dart';
import 'package:flutter/material.dart';

class Console extends StatefulWidget {
  const Console({super.key});

  @override
  State<Console> createState() {
    return _ConsoleState();
  }
}

class _ConsoleState extends State<Console> {
  List results = [];
  int currentDiceRoll = 1;

  void updateDataSource(DiceRoll diceRoll) {
    chartData.add(diceRoll);
  }

  double get currentAvg {
    return results.reduce(
          (value, element) => value + element,
        ) /
        results.length;
  }

  void cleanDataSource() {
    results.clear();
    chartData.clear();
  }

  void rollDice() {
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1;
      results.add(currentDiceRoll);
      updateDataSource(DiceRoll(currentDiceRoll, currentAvg));
    });
  }

  void restart() {
    setState(() {
      cleanDataSource();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DiceRoller(
          currentDiceRoll,
          onRestart: restart,
          onRoll: rollDice,
        ),
        // ignore: prefer_const_constructors
        AvgChart(),
      ],
    );
  }
}
