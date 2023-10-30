import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/controllers/profile_controller.dart';
import 'package:ser_manos/controllers/auth_controllers.dart';
import 'package:ser_manos/design_system/cells/cards.dart';
import 'package:ser_manos/design_system/molecules/buttons.dart';
import 'package:ser_manos/design_system/molecules/components.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';
import 'package:ser_manos/design_system/tokens/grid.dart';
import 'package:ser_manos/design_system/tokens/typography.dart';
import 'package:ser_manos/models/models.dart';

class FullProfileTab extends ConsumerWidget {
  const FullProfileTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLoading = false;

    ref.watch(logOutControllerProvider).maybeWhen(
          orElse: () => {},
          loading: () => isLoading = true,
          error: (e, _) => {}, // TODO: Handle error
        );

    final LogOutController logOutController =
        ref.watch(logOutControllerProvider.notifier);

    final User? profile = ref.watch(profileControllerProvider).when(
          data: (profile) => profile,
          loading: () => null,
          error: (e, _) => null, // TODO: Handle error
        );

    if (profile == null) {
      return const CircularProgressIndicator();
    }

    return SingleChildScrollView(
      child: Container(
        color: SerManosColor.neutral0,
        child: SerManosGrid(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 32, top: 32),
            child: Column(
              children: [
                SerManosProfilePicture.big(profile.image),
                const SizedBox(height: 16),
                SerManosTypography.overline(
                  "Voluntario",
                  color: SerManosColor.neutral75,
                ),
                SerManosTypography.subtitle1(
                  profile.name,
                  color: SerManosColor.neutral100,
                ),
                SerManosTypography.body1(
                  profile.email,
                  color: SerManosColor.secondary200,
                ),
                const SizedBox(height: 32),
                CardInformation(
                  title: "Información personal",
                  label1: "Fecha de nacimiento",
                  content1: profile.birthday,
                  label2: "Género",
                  content2: profile.gender,
                ),
                const SizedBox(height: 32),
                CardInformation(
                  title: "Datos de contacto",
                  label1: "Teléfono",
                  content1: profile.phone,
                  label2: "e-mail",
                  content2: profile.email,
                ),
                const SizedBox(height: 32),
                SerManosButton.cta(
                  "Editar perfil",
                  onPressed: () => context.go("/home/profile/edit"),
                  fill: true,
                  disabled: isLoading,
                ),
                const SizedBox(height: 8),
                SerManosButton.ctaText(
                  "Cerrar sesión",
                  onPressed: () async {
                    await logOutController.logOut();
                  },
                  fill: true,
                  disabled: isLoading,
                  color: SerManosColor.error100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
