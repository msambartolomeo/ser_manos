import 'package:flutter/widgets.dart';
import 'package:ser_manos/design_system/atoms/icons.dart';
import 'package:ser_manos/design_system/molecules/buttons.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';
import 'package:ser_manos/design_system/tokens/grid.dart';
import 'package:ser_manos/design_system/tokens/typography.dart';
import 'package:ser_manos/models/models.dart';

class EmptyProfileTab extends StatelessWidget {
  const EmptyProfileTab({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: SerManosColor.neutral0,
        child: SerManosGrid(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(children: [
                const ProfilePicture(),
                const SizedBox(
                  height: 16,
                ),
                SerManosTypography.overline("Voluntario",
                    color: SerManosColor.neutral75),
                const SizedBox(
                  height: 8,
                ),
                SerManosTypography.subtitle1(
                  user.fullName(),
                  color: SerManosColor.neutral100,
                ),
                const SizedBox(
                  height: 8,
                ),
                SerManosTypography.body1(
                  "¡Completá tu perfil para tener acceso a mejores oportunidades!",
                  color: SerManosColor.neutral75,
                  align: TextAlign.center,
                )
              ]),
              //SizedBox(height: 100),
              SerManosButton.short("Completar", SerManosIconData.add,
                  onPressed: () {}),
            ],
          ),
        ));
  }
}
