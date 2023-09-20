import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';
import 'package:ser_manos/design_system/tokens/typography.dart';

class SerManosTabs extends StatelessWidget {
  const SerManosTabs({
    super.key,
    required this.text,
    required this.onPressed,
    this.active = false,
  });

  final String text;
  final bool active;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 52,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
          backgroundColor:
              active ? SerManosColor.secondary200 : SerManosColor.secondary100,
          shape: const LinearBorder(),
        ),
        child: SerManosTypography.button(
          text,
          color: active ? SerManosColor.neutral0 : SerManosColor.neutral25,
        ),
      ),
    );
  }
}
