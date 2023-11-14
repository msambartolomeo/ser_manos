import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:ser_manos/controllers/profile_controllers.dart';
import 'package:ser_manos/pages/profile/edit_profile.dart';
import 'package:ser_manos/pages/profile/empty_profile.dart';
import 'package:ser_manos/pages/profile/full_profile.dart';

import 'mocks/controllers/profile_controller.dart';
import 'mocks/models/user_mock.dart';

void main() {
  group('Profile Basic Goldens', () {
    testGoldens(
      'Full profile tab',
      (tester) async {
        await tester.pumpWidgetBuilder(
          const ProviderScope(
              child: Center(child: FullProfileTab(user: completeUserMock))),
        );
        await screenMatchesGolden(tester, 'full_profile');
      },
      tags: ["golden", "profile"],
    );
    testGoldens('Empty profile tab', (tester) async {
      await tester.pumpWidgetBuilder(
        const ProviderScope(
            child: Center(child: EmptyProfileTab(user: incompleteUserMock))),
      );
      await screenMatchesGolden(tester, 'empty_profile');
    }, tags: ["golden", "profile"]);
    testGoldens('future test', (tester) async {
      await tester.pumpWidget(
        Localizations(
          locale: const Locale('en', 'US'),
          delegates: const <LocalizationsDelegate<dynamic>>[
            DefaultWidgetsLocalizations.delegate,
            DefaultMaterialLocalizations.delegate,
          ],
          child: ProviderScope(
            overrides: [
              // ignore: scoped_providers_should_specify_dependencies
              profileControllerProvider
                  .overrideWith(() => IncompleteProfileControllerMock())
            ],
            child: Overlay(
              // overlay configuration and entries go here
              initialEntries: [
                OverlayEntry(
                  builder: (context) => const Directionality(
                    textDirection: TextDirection.ltr,
                    child: Material(
                      child: EditProfileModal(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      await screenMatchesGolden(tester, 'edit_profile');
    }, tags: ["golden", "profile"]);
  });
}
