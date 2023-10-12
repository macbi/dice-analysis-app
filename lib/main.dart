import 'package:dice_analysis/console.dart';
import 'package:flutter/material.dart';

import 'package:dice_analysis/gradient_container.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: GradientContainer.gray(child: const Console()),
      ),
    ),
  );
}
