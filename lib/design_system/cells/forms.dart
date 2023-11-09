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
              validator: requiredValidator,
              controller: nameController,
              enabled: enabled,
              label: "Nombre",
              hintText: "Ej: Juan",
            ),
            const SizedBox(height: 24.0),
            SerManosTextInput(
              validator: requiredValidator,
              controller: surnameController,
              enabled: enabled,
              label: "Apellido",
              hintText: "Ej: Barcena",
            ),
            const SizedBox(height: 24.0),
            SerManosTextInput(
              keyboardType: TextInputType.emailAddress,
              validator: validateEmail,
              controller: emailController,
              enabled: enabled,
              label: "Email",
              hintText: "Ej: juanbarcena@mail.com",
            ),
            const SizedBox(height: 24.0),
            SerManosTextInput(
              validator: requiredValidator,
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
              keyboardType: TextInputType.emailAddress,
              validator: validateEmail,
              controller: emailController,
              enabled: enabled,
              label: "Email",
              hintText: "Ej: juanbarcena@mail.com",
            ),
            const SizedBox(height: 24.0),
            SerManosTextInput(
              validator: requiredValidator,
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
              keyboardType: TextInputType.none,
              validator: requiredValidator,
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
              keyboardType: TextInputType.phone,
              validator: validatePhone,
              controller: phoneController,
              enabled: enabled,
              label: "Teléfono",
              hintText: "Ej: +541178445459",
            ),
            const SizedBox(height: 24.0),
            SerManosTextInput(
              keyboardType: TextInputType.emailAddress,
              validator: validateEmail,
              controller: emailController,
              enabled: enabled,
              label: "Mail",
              hintText: "Ej: mimail@mail.com",
            )
          ],
        );

  static String? requiredValidator(String? value) {
    if (value == null || value == "") return "Este campo es obligatorio";
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value == "") return "Este campo es obligatorio";
    return RegExp(
      r'^[a-zA-Z\d.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z\d-]+(?:\.[a-zA-Z\d-]+)*$',
    ).hasMatch(value)
        ? null
        : "No es un email valido";
  }

  static String? validatePhone(String? value) {
    if (value == null || value == "") return "Este campo es obligatorio";
    return RegExp(
      r'\+(9[976]\d|8[987530]\d|6[987]\d|5[90]\d|42\d|3[875]\d|2[98654321]\d|9[8543210]|8[6421]|6[6543210]|5[87654321]|4[987654310]|3[9643210]|2[70]|7|1)\d{1,14}$',
    ).hasMatch(value)
        ? null
        : "No es un telefono valido";
  }
}
