import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/molecules/buttons.dart';
import 'package:ser_manos/design_system/tokens/typography.dart';

// TODO: Missing Shadow
class SerManosModal extends Dialog {
  SerManosModal({
    required BuildContext context,
    super.key,
    required String title,
    String subtitle = "Te estas por postular a",
    required void Function() onConfirm,
  }) : super(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          child: Container(
            width: 280,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SerManosTypography.subtitle1(subtitle),
                SerManosTypography.heading2(title),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SerManosButton.ctaText(
                      "Cancelar",
                      // TODO: Check if this changes with another navigator
                      onPressed: () => {Navigator.of(context).pop()},
                    ),
                    const SizedBox(width: 8),
                    SerManosButton.ctaText("Confirmar", onPressed: onConfirm),
                  ],
                )
              ],
            ),
          ),
        );
}

showSerManosModal(
  BuildContext context,
  String title,
  void Function() onConfirm,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) => SerManosModal(
      context: context,
      title: title,
      onConfirm: onConfirm,
    ),
  );
}
