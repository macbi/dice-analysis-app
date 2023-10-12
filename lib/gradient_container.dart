import 'package:flutter/material.dart';

const startAligment = Alignment.topLeft;
const endAligment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.colorList, {required this.child, super.key});

  GradientContainer.gray({required this.child, super.key})
      : colorList = [
          const Color.fromARGB(255, 226, 226, 226),
          Colors.white,
        ];

  final List<Color> colorList;
  final Widget child;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colorList,
          begin: startAligment,
          end: endAligment,
        ),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
