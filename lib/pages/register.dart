import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/design_system/atoms/logos.dart';
import 'package:ser_manos/design_system/cells/header.dart';
import 'package:ser_manos/design_system/molecules/buttons.dart';
import 'package:ser_manos/design_system/molecules/text_inputs.dart';
import 'package:ser_manos/design_system/tokens/grid.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: SerManosHeader.white(),
      body: SerManosGrid(
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints)
            {return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                            const SquaredLogo(),
                            const SizedBox(
                              height: 31,
                            ),
                            SerManosTextInput(
                              hintText: "Ej: Facundo",
                              label: "Nombre",
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            SerManosTextInput(
                              hintText: "Ej: Gutierrez",
                              label: "Apellido",
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            SerManosTextInput(
                              hintText: "Ej: fgutierrez@mail.com",
                              label: "Email",
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            SerManosTextInput(
                              hintText: "Ej: ABCD1234",
                              label: "Contraseña",
                              obscureText: true,
                            ),
                            const SizedBox(
                              height: 24,
                            )

                      ]
                      ),
                      Column(
                        children: [
                          SerManosButton.cta(
                            "Registrarse",
                            onPressed: () => context.go("/welcome"),
                            fill: true,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SerManosButton.ctaText(
                            "Ya tengo cuenta",
                            onPressed: () => context.go("/login"),
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