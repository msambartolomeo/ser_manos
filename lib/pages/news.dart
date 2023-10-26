import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/design_system/cells/cards.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';
import 'package:ser_manos/design_system/tokens/grid.dart';
import 'package:ser_manos/models/models.dart';
import 'package:ser_manos/providers/news_provider.dart';

class NewsTab extends ConsumerWidget {
  
  const NewsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    AsyncValue<Map<String, News>> news = ref.watch(fetchNewsProvider);

    return news.when(
    loading: () => const CircularProgressIndicator(),
    error: (err, stack) => Text('Error: $err'),
    data: (news) {
    final newsList = news.values.toList();
    return Container(
      color: SerManosColor.secondary10,
      child: SerManosGrid(
        child: ListView.separated(
            padding: const EdgeInsets.only(top: 32, bottom: 24),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return NewsCard(
                image: newsList[index].image,
                overline: newsList[index].overline,
                title: newsList[index].title,
                subtitle: newsList[index].subtitle,
                onPressedFunction: () => context.go("/new_detail", extra: {"news": newsList[index]}),
              );
            },
            separatorBuilder: ((context, index) => const SizedBox(
                  height: 24,
                )),
            itemCount: news.length),
      ),
    );
    },
  );

}
}