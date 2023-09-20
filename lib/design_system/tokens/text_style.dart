import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';

class _BaseTextStyle extends TextStyle {
  const _BaseTextStyle(
    {
    Color color = SerManosColor.neutral100,
    FontWeight weight = FontWeight.w400,
    required double size,
    required double height,
    required double spacing,
  }) : super(
            color: color,
            fontFamily: "Roboto",
            fontSize: size,
            fontStyle: FontStyle.normal,
            fontWeight: weight,
            height: size / height,
            letterSpacing: spacing
                      );
}

class SerManosTextStyle extends _BaseTextStyle {
  const SerManosTextStyle.heading1({super.color})
      : super(        
          size: 24,
          height: 24,
          spacing: 0.18,
        );

  const SerManosTextStyle.heading2({super.color})
      : super(
          size: 20,
          height: 24,
          spacing: 0.15,
          weight: FontWeight.w500,
        );

  const SerManosTextStyle.subtitle1({super.color})
      : super(
          size: 16,
          height: 24,
          spacing: 0.15,
        );

  const SerManosTextStyle.body1({super.color})
      : super(
          size: 14,
          height: 20,
          spacing: 0.25,
        );

  const SerManosTextStyle.body2({super.color})
      : super(
          size: 12,
          height: 16,
          spacing: 0.4,
        );

  const SerManosTextStyle.button({super.color})
      : super(
          size: 14,
          height: 20,
          spacing: 0.1,
          weight: FontWeight.w500,
        );

  const SerManosTextStyle.caption({super.color})
      : super(
          size: 12,
          height: 16,
          spacing: 0.4,
        );


  // TODO: Missing upperCase?
  const SerManosTextStyle.overline({super.color})
      : super(
          size: 10,
          height: 16,
          spacing: 1.5,
          weight: FontWeight.w500,
        );
}