import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/design_system/cells/header.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';
import 'package:ser_manos/pages/full_profile.dart';
import 'package:ser_manos/pages/news.dart';
import 'package:ser_manos/pages/profile.dart';
import 'package:ser_manos/pages/volunteering.dart';
import 'package:ser_manos/router/router.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: SerManosColor.secondary100),
        useMaterial3: true,
      ),
      routerConfig: myRouter,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
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
