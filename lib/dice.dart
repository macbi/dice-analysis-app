import 'dart:math';
import 'package:flutter/material.dart';
import 'package:dice_analysis/model/dice_roll_model.dart';

final randomizer = Random();

class Dice extends StatefulWidget {
  const Dice({super.key, required this.onRoll, required this.diceColor});

  final void Function(int, Category) onRoll;
  final Category diceColor;

  @override
  State<Dice> createState() {
    return _DiceState();
  }
}

class _DiceState extends State<Dice> {
  int currentDiceRoll = 1;

  void rollDice() {
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1;
      widget.onRoll(currentDiceRoll, widget.diceColor);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Column(
          children: [
            Image.asset(
              'assets/images/dice-$currentDiceRoll.png',
              width: 100,
              color: categoryColors[widget.diceColor],
            ),
            const SizedBox(
              height: 20,
            ),
            FilledButton(
              onPressed: rollDice,
              style: TextButton.styleFrom(
                  side: const BorderSide(color: Colors.black87, width: 3),
                  padding: const EdgeInsets.all(10),
                  foregroundColor: Colors.black87,
                  backgroundColor: Colors.transparent,
                  textStyle: const TextStyle(fontSize: 20)),
              child: const Text('Roll Dice'),
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
