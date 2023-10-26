import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';
import 'package:ser_manos/design_system/tokens/text_style.dart';

class _BaseTypography extends Text {
  const _BaseTypography(
    super.text, {
    super.key,
    TextAlign align = TextAlign.left,
    super.maxLines,
    super.overflow,
    Color color = SerManosColor.neutral100,
    TextStyle textStyle = const SerManosTextStyle.heading1(),
  }) : super(
          style: textStyle,
          textAlign: align,
        );
}

class SerManosTypography extends _BaseTypography {
  SerManosTypography.heading1(
    super.text, {
    super.key,
    super.color,
    super.align,
  }) : super(
          textStyle: SerManosTextStyle.heading1(color: color),
        );

  SerManosTypography.heading2(
    super.text, {
    super.key,
    super.color,
    super.align,
  }) : super(
          textStyle: SerManosTextStyle.heading2(color: color),
        );

  SerManosTypography.subtitle1(
    super.text, {
    super.key,
    super.color,
    super.align,
  }) : super(
          textStyle: SerManosTextStyle.subtitle1(color: color),
        );

  SerManosTypography.body1(
    super.text, {
    super.key,
    super.color,
    super.align,
  }) : super(
          textStyle: SerManosTextStyle.body1(color: color),
        );

  SerManosTypography.body2(
    super.text, {
    super.key,
    super.color,
    super.align,
    super.maxLines,
    super.overflow,
  }) : super(
          textStyle: SerManosTextStyle.body2(color: color),
        );

  SerManosTypography.button(
    super.text, {
    super.key,
    super.color,
    super.align,
  }) : super(
          textStyle: SerManosTextStyle.button(color: color),
        );

  SerManosTypography.caption(
    super.text, {
    super.key,
    super.color,
    super.align,
  }) : super(
          textStyle: SerManosTextStyle.caption(color: color),
        );

  SerManosTypography.overline(
    String text, {
    super.key,
    super.color,
    super.align,
  }) : super(
          text.toUpperCase(),
          textStyle: SerManosTextStyle.overline(color: color),
        );
}
