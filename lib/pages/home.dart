import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/cells/header.dart';
import 'package:ser_manos/pages/full_profile.dart';
import 'package:ser_manos/pages/news.dart';
import 'package:ser_manos/pages/volunteering.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, this.index = 0});

  final int index;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        initialIndex: index,
        child: Scaffold(
          appBar: SerManosHeader.tabs(),
          body: const TabBarView(
            children: [
              VolunteeringTab(),
              FullProfileTab(),
              NewsTab(),
            ],
          ),
        ),
      ),
    );
  }
}
