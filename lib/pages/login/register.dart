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

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final surname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;

    String? errorText;

    ref.watch(registerControllerProvider).maybeWhen(
          orElse: () => {},
          loading: () => isLoading = true,
          error: (e, _) {
            errorText = e.toString().split(":")[1];
          },
        );

    final RegisterController registerController =
        ref.watch(registerControllerProvider.notifier);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: SerManosHeader.white(),
        body: Form(
          key: _formKey,
          child: SerManosGrid(
            child: ListView(
              children: [
                const SquaredLogo(),
                const SizedBox(height: 32),
                SerManosForm.register(
                  nameController: name,
                  surnameController: surname,
                  emailController: email,
                  passwordController: password,
                ),
                if (errorText != null)
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        errorText!,
                        style: const SerManosTextStyle.caption(
                          color: SerManosColor.error100,
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 24),
                SerManosButton.cta(
                  "Registrarse",
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await registerController.register(
                        name.text,
                        surname.text,
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
                  "Ya tengo cuenta",
                  onPressed: () => context.go("/login"),
                  fill: true,
                  disabled: isLoading,
                ),
                const SizedBox(height: 32)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
