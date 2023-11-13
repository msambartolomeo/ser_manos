import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/controllers/application_controllers.dart';
import 'package:ser_manos/controllers/profile_controllers.dart';
import 'package:ser_manos/controllers/volunteering_controllers.dart';
import 'package:ser_manos/design_system/atoms/icons.dart';
import 'package:ser_manos/design_system/cells/modal.dart';
import 'package:ser_manos/design_system/molecules/buttons.dart';
import 'package:ser_manos/design_system/molecules/loading.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';
import 'package:ser_manos/design_system/tokens/typography.dart';
import 'package:ser_manos/models/models.dart';

class SerManosVacantsComponent extends ConsumerWidget {
  const SerManosVacantsComponent({super.key, required this.volunteeringId});

  final String volunteeringId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int? vacants = ref.watch(volunteeringStreamProvider).when(
          data: (vacants) => vacants[volunteeringId],
          error: (_, __) => null,
          loading: () => -1,
        );

    if (vacants == null) {
      context.go("/404");
    }

    final bool active = vacants != 0;

    return Card(
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      color: active ? SerManosColor.secondary25 : SerManosColor.neutral25,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SerManosTypography.body2(
              "Vacantes:",
              color: SerManosColor.neutral100,
            ),
            const SizedBox(width: 8.0),
            SerManosIcon.secondary(
              SerManosIconData.person,
              active: true,
              disabled: !active,
            ),
            vacants == -1
                ? const CircularProgressIndicator()
                : SerManosTypography.subtitle1(
                    vacants.toString(),
                    color: active
                        ? SerManosColor.secondary200
                        : SerManosColor.secondary80,
                  ),
          ],
        ),
      ),
    );
  }
}

class SerManosApplyComponent extends ConsumerWidget {
  const SerManosApplyComponent({super.key, required this.volunteering});

  final Volunteering volunteering;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Application? application =
        ref.watch(applicationControllerProvider).maybeWhen(
              data: (application) => application,
              orElse: () => null,
            );

    final User? profile = ref.watch(profileControllerProvider).maybeWhen(
          data: (profile) => profile,
          orElse: () => null,
        );

    final int? vacants = ref.watch(volunteeringStreamProvider).when(
          data: (vacants) => vacants[volunteering.id],
          error: (_, __) => null,
          loading: () => -1,
        );

    if (vacants == null || profile == null) {
      return const SerManosLoading();
    }

    bool hasVoluntering = application != null;
    bool appliedToCurrentVolunteering =
        hasVoluntering && application.volunteering == volunteering.id;

    void leaveCurrentVolunteering() {
      showSerManosModal(
        context,
        title: "¿Estás seguro que querés abandonar tu voluntariado?",
        subtitle: volunteering.name,
        onConfirm: () => ref
            .read(applicationControllerProvider.notifier)
            .dropout()
            .then((_) => context.pop()),
      );
    }

    return Column(children: [
      Visibility(
        visible: hasVoluntering,
        child: appliedToCurrentVolunteering
            ? application.approved
                ? _VolunteeringApply.alreadyAppliedAndAproved(
                    onPressed: leaveCurrentVolunteering,
                  )
                : _VolunteeringApply.alreadyApplied(
                    onPressed: leaveCurrentVolunteering,
                  )
            : _VolunteeringApply.alreadyAppliedToOtherVolunteering(
                onPressed: () => context.go(
                  "/home/volunteerings/${application!.volunteering}",
                ),
              ),
      ),
      Visibility(
        visible: (application == null) ||
            (hasVoluntering && application.volunteering != volunteering.id),
        child: SerManosButton.cta(
          "Postularme",
          onPressed: () {
            if (profile.completed) {
              showSerManosModal(
                context,
                title: "Te estas por postular a",
                subtitle: volunteering.name,
                onConfirm: () {
                  ref
                      .read(applicationControllerProvider.notifier)
                      .apply(volunteering.id)
                      .then((_) => context.pop());
                },
              );
            } else {
              showSerManosModal(
                context,
                title: "Para postularte debes primero completar tus datos.",
                onConfirm: () {
                  context.pop();
                  context.push(
                    "/home/profile/edit",
                    extra: {"volunteering": volunteering},
                  );
                },
                confirmText: "Completar datos",
              );
            }
          },
          fill: true,
          disabled: vacants <= 0 ||
              (hasVoluntering && application.volunteering != volunteering.id),
        ),
      ),
    ]);
  }
}

class _VolunteeringApply extends Column {
  _VolunteeringApply.alreadyApplied({onPressed})
      : super(
          children: [
            SerManosTypography.heading2(
              "Te has postulado",
              align: TextAlign.center,
            ),
            SerManosTypography.body1(
              "Pronto la organización se pondrá en contacto contigo y te inscribirá como participante.",
              align: TextAlign.center,
            ),
            SerManosButton.ctaText(
              "Retirar postulación",
              onPressed: onPressed,
            ),
          ],
        );

  _VolunteeringApply.alreadyAppliedAndAproved({onPressed})
      : super(
          children: [
            SerManosTypography.heading2("Estas participando"),
            SerManosTypography.body1(
              "La organización confirmó que ya estas participando de este voluntariado",
              align: TextAlign.center,
            ),
            SerManosButton.ctaText(
              "Abandonar voluntariado",
              onPressed: onPressed,
            ),
          ],
        );

  _VolunteeringApply.alreadyAppliedToOtherVolunteering({onPressed})
      : super(
          children: [
            SerManosTypography.body1(
              "Ya estas participando en otro voluntariado, debes abandonarlo primero para postularte a este.",
              align: TextAlign.center,
            ),
            SerManosButton.ctaText(
              "Abandonar voluntariado actual",
              onPressed: onPressed,
            ),
          ],
        );
}

class _BaseProfilePicture extends ClipOval {
  _BaseProfilePicture(
    String image, {
    required double width,
    required double height,
    required ImageType type,
  }) : super(
          child: switch (type) {
            ImageType.network => Image.network(
                image,
                width: width,
                height: height,
                fit: BoxFit.cover,
              ),
            ImageType.file => Image.file(
                File(image),
                width: width,
                height: height,
                fit: BoxFit.cover,
              ),
          },
        );
}

enum ImageType {
  network,
  file,
}

class SerManosProfilePicture extends _BaseProfilePicture {
  SerManosProfilePicture.small(super.image, {super.type = ImageType.network})
      : super(width: 84, height: 84);

  SerManosProfilePicture.big(super.image, {super.type = ImageType.network})
      : super(width: 110, height: 110);
}
