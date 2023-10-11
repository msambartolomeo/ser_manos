import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/router/router.dart';

part 'generated/router_provider.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  return myRouter;
}
