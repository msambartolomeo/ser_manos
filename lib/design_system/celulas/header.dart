import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/atoms/logos.dart';
import 'package:ser_manos/design_system/molecules/status_bar.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';
import 'package:ser_manos/design_system/tokens/typography.dart';

class SerManosHeader extends AppBar {
  SerManosHeader.tabs({super.key})
      : super(
          systemOverlayStyle: const SerManosStatusBar.secondary(),
          title: const RectangularLogo(),
          backgroundColor: SerManosColor.secondary90,
          bottom: PreferredSize(
            preferredSize: const TabBar(tabs: []).preferredSize,
            child: ColoredBox(
              color: SerManosColor.secondary100,
              child: TabBar(
                unselectedLabelColor: SerManosColor.neutral25,
                labelColor: SerManosColor.neutral0,
                labelStyle: SerManosTypography.button("pepe").style,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator:
                    const BoxDecoration(color: SerManosColor.secondary200),
                tabs: const [
                  Tab(
                    height: 52,
                    text: "Postularse",
                  ),
                  Tab(
                    height: 52,
                    text: "Mi perfil",
                  ),
                  Tab(
                    height: 52,
                    text: "Novedades",
                  ),
                ],
              ),
            ),
          ),
        );
}
