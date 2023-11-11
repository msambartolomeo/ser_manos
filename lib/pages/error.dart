import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/design_system/atoms/logos.dart';
import 'package:ser_manos/design_system/cells/header.dart';
import 'package:ser_manos/design_system/molecules/buttons.dart';
import 'package:ser_manos/design_system/tokens/grid.dart';
import 'package:ser_manos/design_system/tokens/typography.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: SerManosHeader.section(
        title: "Página no encontrada",
        back: false,
      ),
      body: SerManosGrid(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: Column(
              children: [
                const Spacer(),
                const SquaredLogo(),
                const SizedBox(height: 32),
                SerManosTypography.subtitle1(
                  message,
                  align: TextAlign.center,
                ),
                const Spacer(),
                SerManosButton.cta(
                  "Volver",
                  onPressed: () => context.go("/home/volunteerings"),
                  fill: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
