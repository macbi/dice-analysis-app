import 'package:dice_analysis/model/dice_roll_model.dart';
import 'package:flutter/material.dart';

class Dice {
  Dice(this.color, this.results);

  final Color color;
  final List<DiceRoll> results;
}
