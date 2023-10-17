import 'package:flutter/material.dart';

enum Category { black, white, blue, red, yellow }

const categoryColors = {
  Category.white: Colors.white,
  Category.black: Colors.black87,
  Category.blue: Colors.blueAccent,
  Category.red: Colors.redAccent,
  Category.yellow: Colors.amberAccent,
};

class DiceRoll {
  DiceRoll(this.value, this.category);

  final int value;
  late double currentAvg;
  final Category category;
}

class DiceRollResults {
  DiceRollResults(this.category, this.rolls);

  DiceRollResults.forCategory(List<DiceRoll> allRolls, this.category)
      : rolls = allRolls.where((roll) => roll.category == category).toList();

  final Category category;
  final List<DiceRoll> rolls;
}

// calculate current category avg for dice roll (doesn't count rolls made after parsed roll)
void calcuateCurrentAvg(DiceRollResults allRolls) {
  for (DiceRoll roll in allRolls.rolls) {
    List<DiceRoll> currentRolls = [];
    int sum = 0;

    for (int i = 0; i < allRolls.rolls.indexOf(roll); i++) {
      currentRolls.add(allRolls.rolls[i]);
      sum += allRolls.rolls[i].value;
    }
    double currentAvg = sum / currentRolls.length;
    roll.currentAvg = currentAvg;
  }
}
