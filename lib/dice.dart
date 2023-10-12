import 'package:flutter/material.dart';

class Dice extends StatefulWidget {
  const Dice(this.rollResult, {super.key, required this.onRoll});

  final int rollResult;
  final void Function() onRoll;

  @override
  State<Dice> createState() {
    return _DiceState();
  }
}

class _DiceState extends State<Dice> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/dice-${widget.rollResult}.png',
          width: 100,
        ),
        const SizedBox(
          height: 20,
        ),
        FilledButton(
          onPressed: widget.onRoll,
          style: TextButton.styleFrom(
              side: const BorderSide(color: Colors.black87, width: 3),
              padding: const EdgeInsets.all(10),
              foregroundColor: Colors.black87,
              backgroundColor: Colors.transparent,
              textStyle: const TextStyle(fontSize: 20)),
          child: const Text('Roll Dice'),
        ),
      ],
    );
  }
}
