import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/design_system/cells/header.dart';
import 'package:ser_manos/pages/news.dart';
import 'package:ser_manos/pages/profile/profile.dart';
import 'package:ser_manos/pages/volunteering.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.index});

  final int index;

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
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
