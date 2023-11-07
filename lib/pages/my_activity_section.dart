import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/tokens/grid.dart';
import 'package:ser_manos/models/models.dart';

import '../design_system/cells/cards.dart';
import '../design_system/tokens/typography.dart';

class MyActivitySection extends Column {
  MyActivitySection(
      {super.key, required String? volunteeringName, required onPress})
      : super(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SerManosGrid(
                child: SerManosTypography.heading1(
              "Tu actividad",
              align: TextAlign.start,
            )),
            const SizedBox(height: 16),
            SerManosGrid(
              child: CurrentVolunteerCard(
                onPress: onPress,
                overline: "Acción Social",
                title: volunteeringName ?? "",
              ),
            ),
            const SizedBox(height: 24),
          ],
        );
}
