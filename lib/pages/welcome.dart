import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/atoms/logos.dart';
import 'package:ser_manos/design_system/cells/header.dart';
import 'package:ser_manos/design_system/molecules/buttons.dart';
import 'package:ser_manos/design_system/tokens/grid.dart';
import 'package:ser_manos/design_system/tokens/typography.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SerManosHeader.white(),
      body: SerManosGrid(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const SquaredLogo(),
                  const SizedBox(height: 30),
                  SerManosTypography.heading1("¡Bienvenido!"),
                  const SizedBox(height: 48),
                  SerManosTypography.subtitle1(
                    "Nunca subestimes tu habilidad para mejorar la vida de alguien.",
                    align: TextAlign.center,
                  ),
                ],
              ),
              SerManosButton.cta(
                "Comenzar",
                onPressed: () => {},
                fill: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
