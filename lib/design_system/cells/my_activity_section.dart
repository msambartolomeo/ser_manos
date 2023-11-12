import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/tokens/grid.dart';
import 'package:ser_manos/models/models.dart';

import 'cards.dart';
import '../tokens/typography.dart';

class MyActivitySection extends Column {
  MyActivitySection({
    super.key,
    required Volunteering volunteering,
    required onPress,
  }) : super(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SerManosGrid(
              child: SerManosTypography.heading1(
                "Tu actividad",
                align: TextAlign.start,
              ),
            ),
            const SizedBox(height: 16),
            SerManosGrid(
              child: CurrentVolunteerCard(
                onPress: onPress,
                overline: "Acción Social",
                title: volunteering.name,
                geolocation: volunteering.geolocation,
              ),
            ),
            const SizedBox(height: 24),
          ],
        );
}
