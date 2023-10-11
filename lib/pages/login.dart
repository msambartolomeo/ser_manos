import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/design_system/atoms/logos.dart';
import 'package:ser_manos/design_system/cells/forms.dart';
import 'package:ser_manos/design_system/cells/header.dart';
import 'package:ser_manos/design_system/molecules/buttons.dart';
import 'package:ser_manos/design_system/tokens/grid.dart';
import 'package:ser_manos/servicies/auth_service.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = TextEditingController();
    final password = TextEditingController();

    final AuthService authService = ref.watch(authServiceProvider.notifier);

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
                          SerManosForm.login(
                            emailController: email,
                            passwordController: password,
                          ),
                          const SizedBox(height: 24.0),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          SerManosButton.cta(
                            "Iniciar Sesión",
                            onPressed: () async {
                              await authService.login(
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
