import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/controllers/news_controllers.dart';
import 'package:ser_manos/design_system/cells/cards.dart';
import 'package:ser_manos/design_system/molecules/loading.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';
import 'package:ser_manos/design_system/tokens/grid.dart';
import 'package:ser_manos/models/models.dart';

class NewsTab extends ConsumerWidget {
  const NewsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<News>? news = ref.watch(newsGetAllControllerProvider).when(
          data: (data) => data,
          error: (_, __) => [],
          loading: () => null,
        );

    if (news == null) {
      return const SerManosLoading();
    }

    return Container(
      color: SerManosColor.secondary10,
      child: SerManosGrid(
        child: ListView.separated(
            padding: const EdgeInsets.only(top: 32, bottom: 24),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return NewsCard(
                news: news[index],
                onPressedFunction: () => context.go(
                    "/home/news/${news[index].id}",
                    extra: {"news": news[index]}),
              );
            },
            separatorBuilder: ((context, index) => const SizedBox(
                  height: 24,
                )),
            itemCount: news.length),
      ),
    );
  }
}
