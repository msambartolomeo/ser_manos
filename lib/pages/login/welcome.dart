import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      resizeToAvoidBottomInset: false,
      appBar: SerManosHeader.white(),
      body: SerManosGrid(
        child: Center(
          child: Column(
            children: [
              const Spacer(),
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
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 92),
                child: SerManosButton.cta(
                  "Comenzar",
                  onPressed: () => context.go("/home/volunteerings"),
                  fill: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
