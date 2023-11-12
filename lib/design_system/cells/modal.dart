import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/design_system/molecules/buttons.dart';
import 'package:ser_manos/design_system/tokens/typography.dart';

class SerManosModal extends Dialog {
  SerManosModal({
    super.key,
    required BuildContext context,
    required String title,
    required String cancelText,
    required String confirmText,
    String? subtitle,
    void Function()? onCancel,
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
                SerManosTypography.subtitle1(title),
                if (subtitle != null) SerManosTypography.heading2(subtitle),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SerManosButton.ctaText(
                      cancelText,
                      onPressed: onCancel ?? () => context.pop(),
                    ),
                    const SizedBox(width: 8),
                    SerManosButton.ctaText(
                      confirmText,
                      onPressed: onConfirm,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
}

showSerManosModal(
  BuildContext context, {
  required String title,
  required void Function() onConfirm,
  String? subtitle,
  String cancelText = "Cancelar",
  String confirmText = "Confirmar",
  void Function()? onCancel,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) => SerManosModal(
      context: context,
      onConfirm: onConfirm,
      title: title,
      subtitle: subtitle,
      cancelText: cancelText,
      confirmText: confirmText,
      onCancel: onCancel,
    ),
  );
}
