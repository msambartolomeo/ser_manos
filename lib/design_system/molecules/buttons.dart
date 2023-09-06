import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';
import 'package:ser_manos/design_system/tokens/shadows.dart';
import 'package:ser_manos/design_system/tokens/typography.dart';

const EdgeInsets paddingBig = EdgeInsets.all(12);
const EdgeInsets paddingSmall = EdgeInsets.fromLTRB(12, 8, 12, 8);

OutlinedBorder roundedBorder =
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(4));

class SerManosButton extends Container {
  SerManosButton.cta(String text,
      {super.key, required onPressed, bool disabled = false})
      : super(
          width: 328,
          child: FilledButton(
            onPressed: disabled ? null : onPressed,
            style: FilledButton.styleFrom(
              backgroundColor: SerManosColor.primary100,
              padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
              shape: roundedBorder,
            ),
            child: SerManosTypography.button(
              text,
              color: SerManosColor.neutral0,
            ),
          ),
        );

  SerManosButton.ctaText(String text,
      {super.key, required onPressed, bool disabled = false})
      : super(
          width: 328,
          child: TextButton(
            onPressed: disabled ? null : onPressed,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
              shape: roundedBorder,
            ),
            child: SerManosTypography.button(
              text,
              color: SerManosColor.primary100,
            ),
          ),
        );

  SerManosButton.short(
    String text,
    IconData icon, {
    super.key,
    required onPressed,
    bool disabled = false,
    bool small = false,
  }) : super(
          child: FilledButton(
            onPressed: disabled ? null : onPressed,
            style: FilledButton.styleFrom(
              backgroundColor: SerManosColor.primary100,
              padding: small ? paddingSmall : paddingBig,
              shape: roundedBorder,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon),
                SerManosTypography.button(
                  text,
                  color: SerManosColor.neutral0,
                ),
              ],
            ),
          ),
        );

  SerManosButton.floating(IconData icon,
      {super.key, required onPressed, bool disabled = true})
      : super(
          decoration: BoxDecoration(boxShadow: SerManosShadows.shadow3),
          child: IconButton(
            onPressed: onPressed,
            style: IconButton.styleFrom(
              backgroundColor:
                  disabled ? SerManosColor.neutral10 : SerManosColor.primary10,
              padding: paddingBig,
              shape: roundedBorder,
            ),
            icon: Icon(
              icon,
              color: SerManosColor.primary100,
            ),
          ),
        );
}
