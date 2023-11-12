import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/controllers/application_controllers.dart';
import 'package:ser_manos/controllers/volunteering_controllers.dart';
import 'package:ser_manos/design_system/cells/cards.dart';
import 'package:ser_manos/design_system/molecules/searchbars.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';
import 'package:ser_manos/design_system/tokens/grid.dart';
import 'package:ser_manos/design_system/tokens/typography.dart';
import 'package:ser_manos/models/models.dart';
import 'package:ser_manos/pages/my_activity_section.dart';
import 'package:ser_manos/providers/geolocation_provider.dart';

class VolunteeringTab extends ConsumerWidget {
  const VolunteeringTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<String, int>? vacants =
        ref.watch(volunteeringStreamProvider).when(
              data: (vacants) => vacants,
              error: (e, _) => null,
              loading: () => null,
            );

    final geolocation = ref.watch(determineGeolocationProvider).when(
          data: (geolocation) => geolocation,
          error: (e, _) => null,
          loading: () => null,
        );

    final List<Volunteering>? volunteerings =
        ref.watch(volunteeringGetAllControllerProvider(geolocation)).when(
              data: (vs) => vs,
              error: (_, __) => [],
              loading: () => null,
            );

    final application = ref.watch(applicationControllerProvider).when(
          data: (profile) => profile,
          error: (e, _) => null,
          loading: () => null,
        );

    if (volunteerings == null || vacants == null) {
      return const CircularProgressIndicator();
    }

    final Volunteering? activeVolunteering = volunteerings
        .where((v) => v.id == application?.volunteering)
        .firstOrNull;

    return Container(
      color: SerManosColor.secondary10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          SerManosGrid(child: SerManosSearchBar.map()),
          const SizedBox(height: 24),
          if (application != null && activeVolunteering != null)
            MyActivitySection(
              onPress: () => context.go(
                "/home/volunteerings/${application.volunteering}",
                extra: {"volunteering": activeVolunteering},
              ),
              volunteering: activeVolunteering,
            ),
          SerManosGrid(
            child: SerManosTypography.heading1(
              "Voluntariados",
              align: TextAlign.start,
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(top: 24, bottom: 24),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return SerManosGrid(
                  child: VolunteerCard(
                    volunteering: volunteerings[index],
                    vacants: vacants[volunteerings[index].id] ?? 0,
                    onTapFunction: () => context.go(
                      "/home/volunteerings/${volunteerings[index].id}",
                      extra: {"volunteering": volunteerings[index]},
                    ),
                  ),
                );
              },
              separatorBuilder: ((context, index) =>
                  const SizedBox(height: 24)),
              itemCount: volunteerings.length,
            ),
          )
        ],
      ),
    );
  }
}
