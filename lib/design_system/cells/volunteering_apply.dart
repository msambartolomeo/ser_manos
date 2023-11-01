import 'package:flutter/widgets.dart';
import 'package:ser_manos/design_system/molecules/buttons.dart';
import 'package:ser_manos/design_system/tokens/typography.dart';

class VolunteeringApply extends Column {
  VolunteeringApply({super.key, title, content, textBtn, onPressed})
      : super(children: [
          title != null ? SerManosTypography.heading2(title) : Container(),
          content != null ? SerManosTypography.body1(content) : Container(),
          textBtn != null
              ? SerManosButton.ctaText(textBtn, onPressed: onPressed)
              : Container()
        ]);

  VolunteeringApply.alreadyApplied({super.key})
      : super(children: [
          SerManosTypography.heading2("Te has postulado"),
          SerManosTypography.body1(
              "Pronto la organización se pondrá en contacto contigo y te inscribirá como participante."),
          SerManosButton.ctaText("Retirar postulación", onPressed: () => {})
        ]);

  VolunteeringApply.alreadyAppliedAndAproved({super.key})
      : super(children: [
          SerManosTypography.heading2("Estas participando"),
          SerManosTypography.body1(
              "La organización confirmó que ya estas participando de este voluntariado"),
          SerManosButton.ctaText("Abandonar voluntariado", onPressed: () => {})
        ]);

  VolunteeringApply.alreadyAppliedToOtherVolunteering({super.key})
      : super(children: [
          SerManosTypography.body1(
              "Ya estas participando en otro voluntariado, debes abandonarlo primero para postularte a este."),
          SerManosButton.ctaText("Abandonar voluntariado actual",
              onPressed: () => {})
        ]);
}
