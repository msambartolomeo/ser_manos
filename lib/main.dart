import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';
import 'package:ser_manos/providers/router_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //TODO: habria que usar este valor para trackear o no eventos
  final status = await AppTrackingTransparency.requestTrackingAuthorization();

  await Firebase.initializeApp(
    options: await DefaultFirebaseOptions.currentPlatform,
  );

  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GoRouter router = ref.watch(routerProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Ser Manos",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: SerManosColor.primary100),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
