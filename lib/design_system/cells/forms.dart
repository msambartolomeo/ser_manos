import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/cells/cards.dart';
import 'package:ser_manos/design_system/molecules/text_inputs.dart';
import 'package:ser_manos/design_system/tokens/typography.dart';

class SerManosForm extends Column {
  SerManosForm.register({
    super.key,
    TextEditingController? nameController,
    TextEditingController? surnameController,
    TextEditingController? emailController,
    TextEditingController? passwordController,
  }) : super(children: [
          SerManosTextInput(
            controller: nameController,
            label: "Nombre",
            hintText: "Ej: Juan",
          ),
          const SizedBox(height: 24.0),
          SerManosTextInput(
            controller: surnameController,
            label: "Apellido",
            hintText: "Ej: Barcena",
          ),
          const SizedBox(height: 24.0),
          SerManosTextInput(
            controller: emailController,
            label: "Email",
            hintText: "Ej: juanbarcena@mail.com",
          ),
          const SizedBox(height: 24.0),
          SerManosTextInput(
            controller: passwordController,
            obscureText: true,
            label: "Contraseña",
            hintText: "Ej: ABCD1234",
          ),
        ]);

  SerManosForm.login({
    super.key,
    TextEditingController? emailController,
    TextEditingController? passwordController,
  }) : super(children: [
          SerManosTextInput(
            controller: emailController,
            label: "Email",
            hintText: "Ej: juanbarcena@mail.com",
          ),
          const SizedBox(height: 24.0),
          SerManosTextInput(
            controller: passwordController,
            obscureText: true,
            label: "Contraseña",
            hintText: "Ej: ABCD1234",
          ),
        ]);

  // TODO: add controllers
  SerManosForm.personalData({super.key})
      : super(children: [
          Align(
              alignment: Alignment.centerLeft,
              child: SerManosTypography.heading1("Datos de perfil")),
          const SizedBox(height: 24.0),
          SerManosTextInput.calendar(
            label: "Fecha de nacimiento",
            hintText: "DD/MM/YYYY",
          ),
          const SizedBox(height: 24.0),
          InputCard(),
          const SizedBox(height: 24.0),
          EmptyProfilePictureCard(),
        ]);

  // TODO: add controllers
  SerManosForm.contactData({super.key})
      : super(children: [
          Align(
              alignment: Alignment.centerLeft,
              child: SerManosTypography.heading1("Datos de contacto")),
          const SizedBox(height: 24.0),
          Align(
              alignment: Alignment.centerLeft,
              child: SerManosTypography.subtitle1(
                  "Estos datos serán compartidos con la organización para ponerse en contacto contigo")),
          const SizedBox(height: 24.0),
          SerManosTextInput(
            label: "Teléfono",
            hintText: "Ej: +541178445459",
          ),
          const SizedBox(height: 24.0),
          SerManosTextInput(
            label: "Mail",
            hintText: "Ej: mimail@mail.com",
          )
        ]);
}
