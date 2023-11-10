import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/controllers/profile_controllers.dart';
import 'package:ser_manos/controllers/volunteering_controllers.dart';
import 'package:ser_manos/design_system/cells/cards.dart';
import 'package:ser_manos/design_system/molecules/searchbars.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';
import 'package:ser_manos/design_system/tokens/grid.dart';
import 'package:ser_manos/design_system/tokens/typography.dart';
import 'package:ser_manos/models/models.dart';
import 'package:ser_manos/pages/my_activity_section.dart';

class VolunteeringTab extends ConsumerWidget {
  const VolunteeringTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Map<String, Volunteering>> volunteering =
        ref.watch(volunteeringGetAllControllerProvider);

    AsyncValue<Map<String, int>> vacants =
    ref.watch(volunteeringStreamProvider);

    final profile = ref.watch(profileControllerProvider).when(
          data: (profile) => profile,
          error: (e, _) => null,
          loading: () => null,
        );

    return volunteering.when(
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
      data: (volunteering) {
        final volunteeringList = volunteering.values.toList();
        return vacants.when(
            loading: () => const CircularProgressIndicator(),
            error: (err, stack) => Text('Error: $err'),
            data: (value) {
                  final vacantsList = value.values.toList();
                  return Container(
                    color: SerManosColor.secondary10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24),
                        SerManosGrid(child: SerManosSearchBar.map()),
                        const SizedBox(height: 24),
                        Visibility(
                          visible: profile != null && profile.hasVolunteering(),
                          child: MyActivitySection(
                            // TODO Chequear que el voluntariado existe en la lista?
                            onPress: () => context.go(
                                "/home/volunteerings/${profile?.application?["volunteering"] ?? ""}",
                                extra: {
                                  "volunteering":
                                  volunteering[profile?.application?["volunteering"]]
                                }),
                            volunteeringName:
                            volunteering[profile?.application?["volunteering"]]?.name,
                          ),
                        ),
                        SerManosGrid(
                            child: SerManosTypography.heading1(
                              "Voluntariados",
                              align: TextAlign.start,
                            )),
                        Expanded(
                          child: ListView.separated(
                              padding: const EdgeInsets.only(top: 24, bottom: 24),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return SerManosGrid(
                                  child: VolunteerCard(
                                      image: volunteeringList[index].image,
                                      name: volunteeringList[index].name,
                                      vacant: vacantsList[index],
                                      volunteering: volunteering.keys.elementAt(index),
                                      onTapFunction: () => context.go(
                                          "/home/volunteerings/${volunteering.keys.elementAt(index)}",
                                          extra: {"volunteering": volunteeringList[index]})),
                                );
                              },
                              separatorBuilder: ((context, index) => const SizedBox(
                                height: 24,
                              )),
                              itemCount: volunteeringList.length),
                        )
                      ],
                    ),
                  );
                });
      },
    );
  }
}
