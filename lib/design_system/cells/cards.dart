import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/atoms/icons.dart';
import 'package:ser_manos/design_system/molecules/components.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';
import 'package:ser_manos/design_system/tokens/shadows.dart';
import 'package:ser_manos/design_system/tokens/typography.dart';

class VolunteerCard extends Container {
  VolunteerCard(
      {super.key,
      required ImageProvider<Object> image,
      required String name,
      required int vacantes,
      required bool isFavorite})
      : super(
            decoration: BoxDecoration(
              color: SerManosColor.neutral0,
              borderRadius: const BorderRadius.all(Radius.circular(2.0)),
              boxShadow: SerManosShadows.shadow2,
            ),
            child: Column(
              children: [
                Image(image: image, height: 138, fit: BoxFit.cover),
                Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SerManosTypography.overline("acción social",
                                color: SerManosColor.neutral75),
                            SerManosTypography.subtitle1(name),
                            const SizedBox(height: 4),
                            vacantes == 0 //habria que ver si se deshabilita con 0 o con otra condicion
                                ? SerManosVacantComponent.disabled(vacantes)
                                : SerManosVacantComponent.enabled(vacantes),
                          ],
                        )),
                        Row(children: [
                          isFavorite
                              ? const SerManosIcon.primary(
                                  SerManosIconData.favorite,
                                  active: true)
                              : const SerManosIcon.primary(
                                  SerManosIconData.favoriteOutline,
                                  active: true),
                          const SizedBox(width: 16),
                          const SerManosIcon.primary(SerManosIconData.location,
                              active: true)
                        ])
                      ],
                    ))
              ],
            ));
}
