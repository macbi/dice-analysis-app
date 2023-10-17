import 'dart:math';

import 'package:dice_analysis/dice.dart';
import 'package:dice_analysis/model/dice_roll_model.dart';
import 'package:flutter/material.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key, required this.onRestart, required this.onRoll});

  final void Function() onRestart;
  final void Function(DiceRoll) onRoll;

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  final List<Category> diceColors = [
    Category.blue,
    Category.red,
    Category.yellow,
    Category.white,
  ];
  final List<Dice> _currentDiceList = [];

  void rollDice(int diceRoll, Category category) {
    setState(() {
      widget.onRoll(DiceRoll(diceRoll, category));
    });
  }

  void createDice() {
    setState(() {
      _currentDiceList.add(
        Dice(
          onRoll: rollDice,
          diceColor: diceColors[_currentDiceList.length],
        ),
      );
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Dice(onRoll: rollDice, diceColor: Category.black),
              ..._currentDiceList,
              const SizedBox(
                width: 20,
              ),
              IconButton(
                disabledColor: Colors.black26,
                onPressed: _currentDiceList.length == diceColors.length
                    ? null
                    : createDice,
                icon: const Icon(
                  Icons.add_box,
                  size: 50,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton(
          onPressed: () {
            widget.onRestart();
            _currentDiceList.clear();
          },
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
