import 'package:flutter/widgets.dart';
import 'package:ser_manos/design_system/molecules/buttons.dart';
import 'package:ser_manos/design_system/tokens/typography.dart';

class VolunteeringApply extends Column {
  VolunteeringApply({super.key, title, content, textBtn, onPressed})
      : super(children: [
          title != null
              ? SerManosTypography.heading2(
                  title,
                  align: TextAlign.center,
                )
              : Container(),
          content != null
              ? SerManosTypography.body1(
                  content,
                  align: TextAlign.center,
                )
              : Container(),
          textBtn != null
              ? SerManosButton.ctaText(textBtn, onPressed: onPressed)
              : Container()
        ]);

  VolunteeringApply.alreadyApplied({super.key, onPressed})
      : super(children: [
          SerManosTypography.heading2(
            "Te has postulado",
            align: TextAlign.center,
          ),
          SerManosTypography.body1(
            "Pronto la organización se pondrá en contacto contigo y te inscribirá como participante.",
            align: TextAlign.center,
          ),
          SerManosButton.ctaText("Retirar postulación", onPressed: onPressed)
        ]);

  VolunteeringApply.alreadyAppliedAndAproved({super.key, onPressed})
      : super(children: [
          SerManosTypography.heading2("Estas participando"),
          SerManosTypography.body1(
            "La organización confirmó que ya estas participando de este voluntariado",
            align: TextAlign.center,
          ),
          SerManosButton.ctaText("Abandonar voluntariado", onPressed: onPressed)
        ]);

  VolunteeringApply.alreadyAppliedToOtherVolunteering({super.key, onPressed})
      : super(children: [
          SerManosTypography.body1(
            "Ya estas participando en otro voluntariado, debes abandonarlo primero para postularte a este.",
            align: TextAlign.center,
          ),
          SerManosButton.ctaText("Abandonar voluntariado actual",
              onPressed: onPressed)
        ]);
}
