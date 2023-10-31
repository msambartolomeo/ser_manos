import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/controllers/volunteering_controllers.dart';
import 'package:ser_manos/design_system/cells/cards.dart';
import 'package:ser_manos/design_system/molecules/searchbars.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';
import 'package:ser_manos/design_system/tokens/grid.dart';
import 'package:ser_manos/design_system/tokens/typography.dart';
import 'package:ser_manos/models/models.dart';

class VolunteeringTab extends ConsumerWidget {
  const VolunteeringTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Map<String, Volunteering>> volunteering =
        ref.watch(volunteeringGetAllControllerProvider);

    return volunteering.when(
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
      data: (volunteering) {
        final volunteeringList = volunteering.values.toList();
        return Container(
          color: SerManosColor.secondary10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              SerManosGrid(child: SerManosSearchBar.map()),
              const SizedBox(height: 24),
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
                            vacant: volunteeringList[index].vacants,
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
      },
    );
  }
}
