import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/atoms/icons.dart';
import 'package:ser_manos/design_system/molecules/buttons.dart';
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
                            vacantes ==
                                    0 //habria que ver si se deshabilita con 0 o con otra condicion
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

class NewsCard extends Container {
  NewsCard(
      {super.key,
      required ImageProvider<Object> image,
      required String overline,
      required String title,
      required String body})
      : super(
            decoration: BoxDecoration(
              color: SerManosColor.neutral0,
              borderRadius: const BorderRadius.all(Radius.circular(2.0)),
              boxShadow: SerManosShadows.shadow2,
            ),
            child: Row(
              children: [
                Image(image: image, width: 118, fit: BoxFit.fitHeight),
                Expanded(
                  child: Padding(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SerManosTypography.overline(overline,
                              color: SerManosColor.neutral75),
                          SerManosTypography.subtitle1(title),
                          SerManosTypography.body2(body,
                              color: SerManosColor.neutral75,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SerManosButton.ctaText("Leer Más",
                                  onPressed: () => {})
                            ],
                          )
                        ],
                      )),
                )
              ],
            ));
}

class CurrentVolunteerCard extends Container {
  CurrentVolunteerCard({
    super.key,
    required String overline,
    required String title,
  }) : super(
            decoration: BoxDecoration(
                color: SerManosColor.neutral0,
                borderRadius: const BorderRadius.all(Radius.circular(2.0)),
                boxShadow: SerManosShadows.shadow2,
                border: const Border.fromBorderSide(
                    BorderSide(color: SerManosColor.primary100, width: 2))),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SerManosTypography.overline(overline,
                          color: SerManosColor.neutral75),
                      SerManosTypography.subtitle1(title)
                    ],
                  )),
                  const SerManosIcon.primary(SerManosIconData.location,
                      active: true)
                ],
              ),
            ));
}
