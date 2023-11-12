import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/controllers/news_controllers.dart';
import 'package:ser_manos/design_system/cells/header.dart';
import 'package:ser_manos/design_system/molecules/buttons.dart';
import 'package:ser_manos/design_system/molecules/loading.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';
import 'package:ser_manos/design_system/tokens/grid.dart';
import 'package:ser_manos/design_system/tokens/typography.dart';
import 'package:ser_manos/models/models.dart';
import 'package:share_plus/share_plus.dart';

class NewsDetailPage extends ConsumerWidget {
  final News? news;
  final String id;
  const NewsDetailPage({super.key, required this.news, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    News? anew = news ??
        ref.watch(newsGetByIdControllerProvider(id)).when(
              data: (anew) => anew,
              error: (_, __) {
                context.go("/404");
                return null;
              },
              loading: () => null,
            );

    if (anew == null) {
      return const SerManosLoading();
    }

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
                SerManosTypography.overline(
                  anew.overline,
                  color: SerManosColor.neutral75,
                ),
                SerManosTypography.heading2(
                  anew.title,
                  color: SerManosColor.neutral100,
                ),
                const SizedBox(height: 16),
                Image.network(anew.image, height: 160, fit: BoxFit.cover),
                const SizedBox(height: 16),
                SerManosTypography.subtitle1(
                  anew.subtitle,
                  color: SerManosColor.secondary100,
                ),
                const SizedBox(height: 16),
                SerManosTypography.body1(
                  anew.body,
                  color: SerManosColor.neutral100,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SerManosTypography.heading2(
                      "Comparte esta nota",
                      color: SerManosColor.neutral100,
                    )
                  ],
                ),
                const SizedBox(height: 16),
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
