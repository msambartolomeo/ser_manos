import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/providers/current_user_provider.dart';
import 'package:ser_manos/providers/servicies_providers.dart';
import 'package:ser_manos/router/router.dart';

part 'generated/router_provider.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final bool authState = ref.watch(currentAuthUserProvider) != null;

  return RouterBuilder(authState,
          loggingService: ref.read(loggingServiceProvider))
      .build();
}
