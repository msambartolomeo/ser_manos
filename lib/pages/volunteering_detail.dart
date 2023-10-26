import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/design_system/atoms/icons.dart';
import 'package:ser_manos/design_system/cells/cards.dart';
import 'package:ser_manos/design_system/cells/header.dart';
import 'package:ser_manos/design_system/cells/modal.dart';
import 'package:ser_manos/design_system/molecules/buttons.dart';
import 'package:ser_manos/design_system/molecules/components.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';
import 'package:ser_manos/design_system/tokens/grid.dart';
import 'package:ser_manos/design_system/tokens/typography.dart';
import 'package:ser_manos/models/models.dart';

class VolunteeringDetailPage extends StatefulWidget {
  final Volunteering volunteering;
  final String id;
  const VolunteeringDetailPage(
      {super.key, required this.volunteering, required this.id});

  @override
  State<StatefulWidget> createState() {
    return _VolunteeringDetailState();
  }
}

class _VolunteeringDetailState extends State<VolunteeringDetailPage> {
  @override
  Widget build(BuildContext context) {
    final volunteering = widget.volunteering;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: SerManosHeader.opacity(
          button: IconButton(
        icon: const Icon(
          SerManosIconData.back,
          color: Colors.white,
        ),
        onPressed: () => context.pop(),
      )),
      body: SingleChildScrollView(
        child: Column(children: [
          const Row(
            children: [
              // Expanded(child: Image.network(volunteering.image, fit: BoxFit.cover,))
            ],
          ),
          SerManosGrid(
            child: Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SerManosTypography.overline("Acción social",
                      color: SerManosColor.neutral75),
                  SerManosTypography.heading1(volunteering.name),
                  const SizedBox(
                    height: 16,
                  ),
                  SerManosTypography.body1(
                    volunteering.purpose,
                    color: SerManosColor.secondary200,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SerManosTypography.heading2("Sobre la actividad"),
                  const SizedBox(
                    height: 8,
                  ),
                  SerManosTypography.body1(volunteering.description),
                  const SizedBox(
                    height: 24,
                  ),
                  LocationCardWithoutMap(location: volunteering.address),
                  const SizedBox(
                    height: 24,
                  ),
                  SerManosTypography.heading2("Participar del voluntariado"),
                  const SizedBox(
                    height: 8,
                  ),
                  SerManosTypography.subtitle1("Requisitos"),
                  const SizedBox(
                    height: 8,
                  ),
                  SerManosTypography.body1("• ${volunteering.requirements}"),
                  const SizedBox(
                    height: 8,
                  ),
                  SerManosTypography.subtitle1("Disponibilidad"),
                  const SizedBox(
                    height: 8,
                  ),
                  SerManosTypography.body1("• ${volunteering.disponibility}"),
                  const SizedBox(
                    height: 8,
                  ),
                  SerManosVacantComponent.enabled(volunteering.vacants),
                  const SizedBox(
                    height: 24,
                  ),
                  SerManosButton.cta("Postularme", onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return SerManosModal(
                              context: context,
                              title: volunteering.name,
                              onConfirm: () {});
                        });
                  }, fill: true)
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
