import 'package:flutter/material.dart';

class SquaredLogo extends StatelessWidget {
  const SquaredLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/logo cuadrado.png',
      height: 150,
      width: 150,
    );
  }
}

class RectangularLogo extends StatelessWidget {
  const RectangularLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/logo rectangular.png',
      height: 25,
    );
  }
}
