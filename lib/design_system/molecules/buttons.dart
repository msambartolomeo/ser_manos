import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';
import 'package:ser_manos/design_system/tokens/typography.dart';

class SerManosButtonCTA extends FilledButton {
  SerManosButtonCTA(String text, {super.key, required super.onPressed})
      : super(
          child: SerManosTypography.button(
            text,
            color: SerManosColor.neutral0,
          ),
          style:
              FilledButton.styleFrom(backgroundColor: SerManosColor.primary100),
        );
}
