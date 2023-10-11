import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/design_system/atoms/logos.dart';
import 'package:ser_manos/design_system/cells/forms.dart';
import 'package:ser_manos/design_system/cells/header.dart';
import 'package:ser_manos/design_system/molecules/buttons.dart';
import 'package:ser_manos/design_system/tokens/grid.dart';
import 'package:ser_manos/servicies/auth_service.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AuthService authService = ref.watch(authServiceProvider.notifier);
    final name = TextEditingController();
    final surname = TextEditingController();
    final email = TextEditingController();
    final password = TextEditingController();

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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                        const SquaredLogo(),
                        const SizedBox(
                          height: 31,
                        ),
                        SerManosForm.register(
                          nameController: name,
                          surnameController: surname,
                          emailController: email,
                          passwordController: password,
                        ),
                        const SizedBox(height: 24.0),
                      ]),
                      const Spacer(),
                      Column(
                        children: [
                          SerManosButton.cta(
                            "Registrarse",
                            onPressed: () async {
                              await authService.register(
                                name.text,
                                surname.text,
                                email.text,
                                password.text,
                              );
                              // TODO: move to service
                              context.go("/welcome");
                            },
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
