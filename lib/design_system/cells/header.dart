import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/atoms/logos.dart';
import 'package:ser_manos/design_system/molecules/status_bar.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';
import 'package:ser_manos/design_system/tokens/text_style.dart';
import 'package:ser_manos/design_system/tokens/typography.dart';

class SerManosHeader extends AppBar {
  SerManosHeader.tabs({super.key})
      : super(
          systemOverlayStyle: const SerManosStatusBar.secondary(),
          title: const Padding(
            padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
            child: RectangularLogo(),
          ),
          backgroundColor: SerManosColor.secondary90,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(52),
            child: Material(
              color: SerManosColor.secondary100,
              child: TabBar(
                unselectedLabelColor: SerManosColor.neutral25,
                labelColor: SerManosColor.neutral0,
                labelStyle: SerManosTextStyle.button(),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: SerManosColor.secondary200,
                  border: Border(
                    bottom: BorderSide(color: SerManosColor.neutral0, width: 3),
                  ),
                ),
                tabs: [
                  Tab(
                    height: 52,
                    text: "Postularse",
                  ),
                  Tab(
                    text: "Mi perfil",
                  ),
                  Tab(
                    text: "Novedades",
                  ),
                ],
              ),
            ),
          ),
        );

  SerManosHeader.modal({super.key})
      : super(
          systemOverlayStyle: const SerManosStatusBar.white(),
          leading: const CloseButton(color: SerManosColor.neutral75),
        );

  SerManosHeader.white({super.key})
      : super(systemOverlayStyle: const SerManosStatusBar.white());

  SerManosHeader.section({super.key, required String title})
      : super(
          systemOverlayStyle: const SerManosStatusBar.secondary(),
          backgroundColor: SerManosColor.secondary90,
          leading: const BackButton(color: SerManosColor.neutral0),
          centerTitle: true,
          title: SerManosTypography.subtitle1(
            title,
            color: SerManosColor.neutral0,
          ),
        );

  SerManosHeader.opacity({
    super.key,
    required Widget button,
  }) : super(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Colors.black, Colors.black.withOpacity(0.0)],
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: button);

            
}