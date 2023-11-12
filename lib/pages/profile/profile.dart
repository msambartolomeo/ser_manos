import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/design_system/molecules/loading.dart';
import 'package:ser_manos/models/models.dart';
import 'package:ser_manos/pages/profile/empty_profile.dart';
import 'package:ser_manos/pages/profile/full_profile.dart';
import 'package:ser_manos/providers/current_user_provider.dart';

class ProfileTab extends ConsumerWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? user = ref.watch(currentUserProvider).when(
          data: (user) => user,
          loading: () => null,
          error: (e, _) {
            context.go("/login");
            return null;
          },
        );

    if (user == null) {
      return const SerManosLoading();
    }

    return switch (user.completed) {
      true => FullProfileTab(user: user),
      false => EmptyProfileTab(user: user),
    };
  }
}
