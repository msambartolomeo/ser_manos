import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/controllers/auth_controllers.dart';
import 'package:ser_manos/design_system/atoms/logos.dart';
import 'package:ser_manos/design_system/cells/forms.dart';
import 'package:ser_manos/design_system/cells/header.dart';
import 'package:ser_manos/design_system/molecules/buttons.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';
import 'package:ser_manos/design_system/tokens/grid.dart';
import 'package:ser_manos/design_system/tokens/text_style.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;

    String? errorText;

    ref.watch(loginControllerProvider).maybeWhen(
          orElse: () => {},
          loading: () => isLoading = true,
          error: (e, _) {
            errorText = e.toString().split(":")[1];
          },
        );

    final LoginController loginController =
        ref.watch(loginControllerProvider.notifier);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: SerManosHeader.white(),
        body: Form(
          key: _formKey,
          child: SerManosGrid(
            child: Column(
              children: [
                const Spacer(),
                const SquaredLogo(),
                const SizedBox(height: 32),
                SerManosForm.login(
                  emailController: email,
                  passwordController: password,
                ),
                if (errorText != null)
                  Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        errorText!,
                        style: const SerManosTextStyle.caption(
                          color: SerManosColor.error100,
                        ),
                      ),
                    ],
                  ),
                const Spacer(),
                const SizedBox(height: 24),
                SerManosButton.cta(
                  "Iniciar Sesión",
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await loginController.login(
                        email.text,
                        password.text,
                      );
                    }
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
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
