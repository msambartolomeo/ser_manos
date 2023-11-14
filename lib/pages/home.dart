import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/design_system/cells/header.dart';
import 'package:ser_manos/pages/news/news.dart';
import 'package:ser_manos/pages/profile/profile.dart';
import 'package:ser_manos/pages/volunteerings/volunteering.dart';
import 'package:ser_manos/providers/geolocation_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key, required this.index});

  final int index;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 3,
      vsync: this,
      initialIndex: widget.index,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(determineGeolocationProvider);

    tap(int index) {
      final subpath = switch (index) {
        0 => "volunteerings",
        1 => "profile",
        2 => "news",
        _ => "",
      };

      context.go("/home/$subpath");
    }

    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: SerManosHeader.tabs(controller: _controller, onTap: tap),
        body: TabBarView(
          controller: _controller,
          children: const [
            VolunteeringTab(),
            ProfileTab(),
            NewsTab(),
          ],
        ),
      ),
    );
  }
}
