import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/design_system/atoms/logos.dart';
import 'package:ser_manos/design_system/cells/header.dart';
import 'package:ser_manos/design_system/molecules/buttons.dart';
import 'package:ser_manos/design_system/tokens/grid.dart';
import 'package:ser_manos/design_system/tokens/typography.dart';

class EntryPage extends StatelessWidget {
  const EntryPage({super.key});

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
                  const SizedBox(height: 32),
                  SerManosTypography.subtitle1(
                    "“El esfuerzo desinteresado para llevar alegría a los demás será el comienzo de una vida más feliz para nosotros”",
                    align: TextAlign.center,
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  SerManosButton.cta(
                    "Iniciar Sesión",
                    onPressed: () => context.go("/login"),
                    fill: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SerManosButton.ctaText(
                    "Registrarse",
                    onPressed: () => context.go("/register"),
                    fill: true,
                  ),
                  const SizedBox(
                    height: 32,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
