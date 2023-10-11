import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/design_system/atoms/logos.dart';
import 'package:ser_manos/design_system/cells/header.dart';
import 'package:ser_manos/design_system/molecules/buttons.dart';
import 'package:ser_manos/design_system/molecules/text_inputs.dart';
import 'package:ser_manos/design_system/tokens/grid.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SerManosHeader.white(),
      body: SerManosGrid(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      const Spacer(),
                      Column(
                        children: [
                          const SquaredLogo(),
                          const SizedBox(height: 32),
                          SerManosTextInput(
                            label: "Email",
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          SerManosTextInput(
                            label: "Contraseña",
                            obscureText: true,
                          ),
                          const SizedBox(
                            height: 24,
                          )
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          SerManosButton.cta(
                            "Iniciar Sesión",
                            onPressed: () => context.go("/welcome"),
                            fill: true,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SerManosButton.ctaText(
                            "No tengo cuenta",
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
          },
        ),
      ),
    );
  }
}
