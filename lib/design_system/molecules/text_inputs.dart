import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/atoms/icons.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';
import 'package:ser_manos/design_system/tokens/text_style.dart';

class SerManosTextInput extends TextFormField {
  static const _neutral75Border = OutlineInputBorder(
      borderSide: BorderSide(color: SerManosColor.neutral75));
  static const _error100Border =
      OutlineInputBorder(borderSide: BorderSide(color: SerManosColor.error100));
  static const _secondary100Border = OutlineInputBorder(
      borderSide: BorderSide(color: SerManosColor.secondary200));
  static const _neutral50Border = OutlineInputBorder(
      borderSide: BorderSide(color: SerManosColor.neutral50));

  static const _baseInputDecoration = InputDecoration(
    disabledBorder: _neutral50Border,
    border: _neutral75Border,
    focusedBorder: _secondary100Border,
    labelStyle: SerManosTextStyle.subtitle1(color: SerManosColor.neutral75),
    floatingLabelStyle:
        SerManosTextStyle.caption(color: SerManosColor.neutral75),
    hintStyle: SerManosTextStyle.subtitle1(color: SerManosColor.neutral50),
    errorBorder: _error100Border,
    errorStyle: SerManosTextStyle.body2(color: SerManosColor.error100),
  );

  SerManosTextInput(
      {super.key,
      required label,
      hintText = "",
      super.controller,
      super.onSaved,
      super.validator,
      super.enabled,
      super.obscureText})
      : super(
          decoration: _baseInputDecoration.copyWith(
              hintText: hintText,
              labelText: label,
              floatingLabelBehavior: hintText != ""
                  ? FloatingLabelBehavior.always
                  : FloatingLabelBehavior.auto),
          style: const SerManosTextStyle.subtitle1(
              color: SerManosColor.neutral100),
        );

  SerManosTextInput.calendar(
      {super.key,
      required label,
      hintText = "",
      super.controller,
      super.onSaved,
      super.validator,
      super.enabled})
      : super(
          decoration: _baseInputDecoration.copyWith(
            hintText: hintText,
            floatingLabelBehavior: hintText != ""
                ? FloatingLabelBehavior.always
                : FloatingLabelBehavior.auto,
            helperText: "Día / Mes / Año",
            helperStyle:
                const SerManosTextStyle.body2(color: SerManosColor.neutral75),
            labelText: label,
            suffixIcon: const SerManosIcon.primary(SerManosIconData.calendar,
                active: true),
          ),
          style: const SerManosTextStyle.subtitle1(
              color: SerManosColor.neutral100),
        );
}
