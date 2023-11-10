import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/cells/header.dart';
import 'package:ser_manos/design_system/molecules/buttons.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';
import 'package:ser_manos/design_system/tokens/grid.dart';
import 'package:ser_manos/design_system/tokens/typography.dart';
import 'package:ser_manos/models/models.dart';
import 'package:share_plus/share_plus.dart';

class NewDetailPage extends StatelessWidget {
  final News news;
  final String id;
  const NewDetailPage({super.key, required this.news, required this.id});

  @override
  Widget build(BuildContext context) {
    News anew = news;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: SerManosHeader.section(title: "Novedades"),
      body: SerManosGrid(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SerManosTypography.overline(anew.overline,
                    color: SerManosColor.neutral75),
                SerManosTypography.heading2(anew.title,
                    color: SerManosColor.neutral100),
                const SizedBox(
                  height: 16,
                ),
                Image.network(anew.image, height: 160, fit: BoxFit.cover),
                const SizedBox(
                  height: 16,
                ),
                SerManosTypography.subtitle1(
                  anew.subtitle,
                  color: SerManosColor.secondary100,
                ),
                const SizedBox(
                  height: 16,
                ),
                SerManosTypography.body1(anew.body,
                    color: SerManosColor.neutral100),
                const SizedBox(
                  height: 16,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SerManosTypography.heading2("Comparte esta nota",
                      color: SerManosColor.neutral100)
                ]),
                const SizedBox(
                  height: 16,
                ),
                SerManosButton.cta(
                  "Compartir",
                  onPressed: () {
                    Share.share("https://sermanos.itba.edu.ar/home/news/$id");
                  },
                  fill: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
