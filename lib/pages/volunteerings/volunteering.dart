import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/controllers/application_controllers.dart';
import 'package:ser_manos/controllers/volunteering_controllers.dart';
import 'package:ser_manos/design_system/cells/cards.dart';
import 'package:ser_manos/design_system/molecules/loading.dart';
import 'package:ser_manos/design_system/molecules/searchbar.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';
import 'package:ser_manos/design_system/tokens/grid.dart';
import 'package:ser_manos/design_system/tokens/typography.dart';
import 'package:ser_manos/models/models.dart';
import 'package:ser_manos/design_system/cells/my_activity_section.dart';

class VolunteeringTab extends ConsumerWidget {
  const VolunteeringTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<String, int>? vacants =
        ref.watch(volunteeringStreamProvider).when(
              data: (vacants) => vacants,
              error: (e, _) => {},
              loading: () => null,
            );

    final List<Volunteering>? volunteerings =
        ref.watch(volunteeringControllerProvider).when(
              data: (vs) => vs,
              error: (_, __) => [],
              loading: () => null,
            );

    final void Function(String?) onSearch =
        ref.watch(volunteeringControllerProvider.notifier).setSearch;

    final application = ref.watch(applicationControllerProvider).when(
          data: (profile) => profile,
          error: (e, _) => null,
          loading: () => null,
        );

    if (volunteerings == null || vacants == null) {
      return const SerManosLoading();
    }

    final Volunteering? activeVolunteering = volunteerings
        .where((v) => v.id == application?.volunteering)
        .firstOrNull;

    return Container(
      color: SerManosColor.secondary10,
      child: SerManosGrid(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            SerManosSearchBar(onSearch: onSearch),
            const SizedBox(height: 24),
            if (application != null && activeVolunteering != null)
              MyActivitySection(
                onPress: () => context.go(
                  "/home/volunteerings/${application.volunteering}",
                  extra: {"volunteering": activeVolunteering},
                ),
                volunteering: activeVolunteering,
              ),
            SerManosTypography.heading1(
              "Voluntariados",
              align: TextAlign.start,
            ),
            volunteerings.isEmpty | vacants.isEmpty
                ? Column(
                    children: [
                      const SizedBox(height: 24),
                      NoVolunteeringsCard(),
                    ],
                  )
                : Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.only(top: 24, bottom: 24),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return VolunteerCard(
                          volunteering: volunteerings[index],
                          vacants: vacants[volunteerings[index].id] ?? 0,
                          onTapFunction: () => context.go(
                            "/home/volunteerings/${volunteerings[index].id}",
                            extra: {"volunteering": volunteerings[index]},
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
      ),
    );
  }
}
