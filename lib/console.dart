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
  void updateDataSource(DiceRoll diceRoll) {
    setState(() {
      rolls.add(diceRoll);
    });
  }

  void restart() {
    setState(() {
      rolls.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DiceRoller(
          onRestart: restart,
          onRoll: updateDataSource,
        ),
        // ignore: prefer_const_constructors
        AvgChart(),
      ],
    );
  }
}
