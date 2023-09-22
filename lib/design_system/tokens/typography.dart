import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';

class _BaseTypography extends Text {
  _BaseTypography(
    String text, {
    super.key,
    super.maxLines,
    super.overflow,
    Color color = SerManosColor.neutral100,
    FontWeight weight = FontWeight.w400,
    required double size,
    required double height,
    required double spacing,
  }) : super(
          text,
          style: TextStyle(
            color: color,
            fontFamily: "Roboto",
            fontSize: size,
            fontStyle: FontStyle.normal,
            fontWeight: weight,
            height: 1 + size / height,
            letterSpacing: spacing,
          ),
        );
}

class SerManosTypography extends _BaseTypography {
  SerManosTypography.heading1(String text, {super.key, super.color})
      : super(
          text,
          size: 24,
          height: 24,
          spacing: 0.18,
        );

  SerManosTypography.heading2(String text, {super.key, super.color})
      : super(
          text,
          size: 20,
          height: 24,
          spacing: 0.15,
          weight: FontWeight.w500,
        );

  SerManosTypography.subtitle1(String text, {super.key, super.color})
      : super(
          text,
          size: 16,
          height: 24,
          spacing: 0.15,
        );

  SerManosTypography.body1(String text, {super.key, super.color})
      : super(
          text,
          size: 14,
          height: 20,
          spacing: 0.25,
        );

  SerManosTypography.body2(String text, {super.key, super.color, super.maxLines, super.overflow})
      : super(
          text,
          size: 12,
          height: 16,
          spacing: 0.4,
        );

  SerManosTypography.button(String text, {super.key, super.color})
      : super(
          text,
          size: 14,
          height: 20,
          spacing: 0.1,
          weight: FontWeight.w500,
        );

  SerManosTypography.caption(String text, {super.key, super.color})
      : super(
          text,
          size: 12,
          height: 16,
          spacing: 0.4,
        );

  SerManosTypography.overline(String text, {super.key, super.color})
      : super(
          text.toUpperCase(),
          size: 10,
          height: 16,
          spacing: 1.5,
          weight: FontWeight.w500,
        );
}
