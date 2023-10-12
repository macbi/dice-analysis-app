import 'dart:math';

import 'package:dice_analysis/dice.dart';
import 'package:flutter/material.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller(this.rollResult,
      {super.key, required this.onRestart, required this.onRoll});

  final int rollResult;
  final void Function() onRestart;
  final void Function() onRoll;

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Dice(
                widget.rollResult,
                onRoll: widget.onRoll,
              ),
              const SizedBox(
                width: 20,
              ),
              Dice(
                widget.rollResult,
                onRoll: widget.onRoll,
              ),
              const SizedBox(
                width: 20,
              ),
              Dice(
                widget.rollResult,
                onRoll: widget.onRoll,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton(
          onPressed: widget.onRestart,
          child: const Text(
            'restart',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}
