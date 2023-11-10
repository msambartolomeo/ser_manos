import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/controllers/auth_controllers.dart';
import 'package:ser_manos/design_system/atoms/logos.dart';
import 'package:ser_manos/design_system/cells/forms.dart';
import 'package:ser_manos/design_system/cells/header.dart';
import 'package:ser_manos/design_system/molecules/buttons.dart';
import 'package:ser_manos/design_system/tokens/grid.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = TextEditingController();
    final password = TextEditingController();
    bool isLoading = false;

    ref.watch(loginControllerProvider).maybeWhen(
          orElse: () => {},
          loading: () => isLoading = true,
          error: (e, _) => {}, // TODO: Handle error
        );

    final LoginController loginController =
        ref.watch(loginControllerProvider.notifier);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: SerManosHeader.white(),
        body: SerManosGrid(
          child: Column(
            children: [
              const Spacer(),
              const SquaredLogo(),
              const SizedBox(height: 32),
              SerManosForm.login(
                emailController: email,
                passwordController: password,
              ),
              const Spacer(),
              const SizedBox(height: 24),
              SerManosButton.cta(
                "Iniciar Sesión",
                onPressed: () async {
                  await loginController.login(
                    email.text,
                    password.text,
                  );
                },
                disabled: isLoading,
                fill: true,
              ),
              const SizedBox(height: 16),
              SerManosButton.ctaText(
                "No tengo cuenta",
                onPressed: () => context.go("/register"),
                fill: true,
                disabled: isLoading,
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
