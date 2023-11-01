import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/cells/cards.dart';
import 'package:ser_manos/design_system/molecules/components.dart';
import 'package:ser_manos/design_system/molecules/text_inputs.dart';
import 'package:ser_manos/design_system/tokens/typography.dart';
import 'package:ser_manos/models/models.dart';

class SerManosForm extends Column {
  SerManosForm.register({
    super.key,
    required TextEditingController nameController,
    required TextEditingController surnameController,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    bool enabled = true,
  }) : super(
          children: [
            SerManosTextInput(
              controller: nameController,
              enabled: enabled,
              label: "Nombre",
              hintText: "Ej: Juan",
            ),
            const SizedBox(height: 24.0),
            SerManosTextInput(
              controller: surnameController,
              enabled: enabled,
              label: "Apellido",
              hintText: "Ej: Barcena",
            ),
            const SizedBox(height: 24.0),
            SerManosTextInput(
              controller: emailController,
              enabled: enabled,
              label: "Email",
              hintText: "Ej: juanbarcena@mail.com",
            ),
            const SizedBox(height: 24.0),
            SerManosTextInput(
              controller: passwordController,
              enabled: enabled,
              obscureText: true,
              label: "Contraseña",
              hintText: "Ej: ABCD1234",
            ),
          ],
        );

  SerManosForm.login({
    super.key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    bool enabled = true,
  }) : super(
          children: [
            SerManosTextInput(
              controller: emailController,
              enabled: enabled,
              label: "Email",
              hintText: "Ej: juanbarcena@mail.com",
            ),
            const SizedBox(height: 24.0),
            SerManosTextInput(
              controller: passwordController,
              enabled: enabled,
              obscureText: true,
              label: "Contraseña",
              hintText: "Ej: ABCD1234",
            ),
          ],
        );

  SerManosForm.personalData({
    super.key,
    required BuildContext context,
    required TextEditingController birthdateController,
    required Gender? selectedGender,
    required void Function(Gender?) onGenderChange,
    String? image,
    ImageType imageType = ImageType.network,
    required void Function(File? image) onImageChange,
    bool enabled = true,
  }) : super(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SerManosTypography.heading1("Datos de perfil"),
            ),
            const SizedBox(height: 24.0),
            SerManosTextInput.calendar(
              context: context,
              enabled: enabled,
              label: "Fecha de nacimiento",
              hintText: "DD/MM/YYYY",
              controller: birthdateController,
            ),
            const SizedBox(height: 24.0),
            GenderCard(
              selectedGender: selectedGender,
              onGenderChange: onGenderChange,
            ),
            const SizedBox(height: 24.0),
            ProfilePicture(
              image: image,
              onImageChange: onImageChange,
              imageType: imageType,
              enabled: enabled,
            ),
          ],
        );

  SerManosForm.contactData({
    super.key,
    required TextEditingController phoneController,
    required TextEditingController emailController,
    bool enabled = true,
  }) : super(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SerManosTypography.heading1("Datos de contacto"),
            ),
            const SizedBox(height: 24.0),
            Align(
              alignment: Alignment.centerLeft,
              child: SerManosTypography.subtitle1(
                "Estos datos serán compartidos con la organización para ponerse en contacto contigo",
              ),
            ),
            const SizedBox(height: 24.0),
            SerManosTextInput(
              controller: phoneController,
              enabled: enabled,
              label: "Teléfono",
              hintText: "Ej: +541178445459",
            ),
            const SizedBox(height: 24.0),
            SerManosTextInput(
              controller: emailController,
              enabled: enabled,
              label: "Mail",
              hintText: "Ej: mimail@mail.com",
            )
          ],
        );
}
