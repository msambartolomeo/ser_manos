import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';
import 'package:ser_manos/design_system/tokens/text_style.dart';

class _BaseTypography extends Text {
  const _BaseTypography(
    String text, {
    super.key,
    TextAlign align = TextAlign.left,
    Color color = SerManosColor.neutral100,
    TextStyle textStyle = const SerManosTextStyle.heading1(),
  }) : super(
          text,
          style: textStyle,
          textAlign: align,
        );
}

class SerManosTypography extends _BaseTypography {
  SerManosTypography.heading1(
    String text, {
    super.key,
    super.color,
    super.align,
  }) : super(
          text,
          textStyle: SerManosTextStyle.heading1(color: color),
        );

  SerManosTypography.heading2(
    String text, {
    super.key,
    super.color,
    super.align,
  }) : super(
          text,
          textStyle: SerManosTextStyle.heading2(color: color),
        );

  SerManosTypography.subtitle1(
    String text, {
    super.key,
    super.color,
    super.align,
  }) : super(
          text,
          textStyle: SerManosTextStyle.subtitle1(color: color),
        );

  SerManosTypography.body1(
    String text, {
    super.key,
    super.color,
    super.align,
  }) : super(
          text,
          textStyle: SerManosTextStyle.body1(color: color),
        );

  SerManosTypography.body2(
    String text, {
    super.key,
    super.color,
    super.align,
  }) : super(
          text,
          textStyle: SerManosTextStyle.body2(color: color),
        );

  SerManosTypography.button(
    String text, {
    super.key,
    super.color,
    super.align,
  }) : super(
          text,
          textStyle: SerManosTextStyle.button(color: color),
        );

  SerManosTypography.caption(
    String text, {
    super.key,
    super.color,
    super.align,
  }) : super(
          text,
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
