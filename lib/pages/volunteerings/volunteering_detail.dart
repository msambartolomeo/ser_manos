import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/controllers/volunteering_controllers.dart';
import 'package:ser_manos/design_system/cells/cards.dart';
import 'package:ser_manos/design_system/cells/header.dart';
import 'package:ser_manos/design_system/molecules/components.dart';
import 'package:ser_manos/design_system/molecules/loading.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';
import 'package:ser_manos/design_system/tokens/grid.dart';
import 'package:ser_manos/design_system/tokens/typography.dart';
import 'package:ser_manos/models/models.dart';

class VolunteeringDetailPage extends ConsumerWidget {
  final Volunteering? volunteering;
  final String id;
  const VolunteeringDetailPage({
    super.key,
    required this.volunteering,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Volunteering? data = volunteering ??
        ref.watch(volunteeringGetByIdControllerProvider(id)).when(
              data: (volunteering) => volunteering,
              error: (e, _) {
                context.go("/404");
                return null;
              },
              loading: () => null,
            );

    if (data == null) {
      return const SerManosLoading();
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: SerManosHeader.opacity(),
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            children: [
              Expanded(
                child: Image.network(data.image, fit: BoxFit.cover),
              )
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
                  SerManosTypography.heading1(data.name),
                  const SizedBox(height: 16),
                  SerManosTypography.body1(
                    data.purpose,
                    color: SerManosColor.secondary200,
                  ),
                  const SizedBox(height: 24),
                  SerManosTypography.heading2("Sobre la actividad"),
                  const SizedBox(height: 8),
                  SerManosTypography.body1(data.description),
                  const SizedBox(height: 24),
                  LocationCardWithoutMap(
                    location: data.address,
                    geolocation: data.geolocation,
                  ),
                  const SizedBox(height: 24),
                  SerManosTypography.heading2("Participar del voluntariado"),
                  const SizedBox(height: 8),
                  SerManosTypography.subtitle1("Requisitos"),
                  const SizedBox(height: 8),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.requirements.length,
                    itemBuilder: (context, index) {
                      return SerManosTypography.body1("• ${data.requirements[index]}");
                    },
                  ),
                  const SizedBox(height: 8),
                  SerManosTypography.subtitle1("Disponibilidad"),
                  const SizedBox(height: 8),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.disponibility.length,
                    itemBuilder: (context, index) {
                      return SerManosTypography.body1("• ${data.disponibility[index]}");
                    },
                  ),
                  const SizedBox(height: 8),
                  SerManosVacantsComponent(volunteeringId: data.id),
                  const SizedBox(height: 24),
                  SerManosApplyComponent(volunteering: data),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
