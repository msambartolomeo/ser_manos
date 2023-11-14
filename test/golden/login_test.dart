import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:ser_manos/pages/login/entry.dart';
import 'package:ser_manos/pages/login/login.dart';
import 'package:ser_manos/pages/login/register.dart';
import 'package:ser_manos/pages/login/welcome.dart';

void main() {
  group("Login goldens", () {
    testGoldens(
      'Entry page',
      (tester) async {
        await tester.pumpWidgetBuilder(
          const ProviderScope(child: Center(child: EntryPage())),
        );
        await screenMatchesGolden(tester, 'entry_page');
      },
      tags: ["golden", "auth"],
    );

    testGoldens(
      'Welcome page',
      (tester) async {
        await tester.pumpWidgetBuilder(
          const ProviderScope(child: Center(child: WelcomePage())),
        );
        await screenMatchesGolden(tester, 'welcome_page');
      },
      tags: ["golden", "auth"],
    );

    testGoldens(
      'Login page',
      (tester) async {
        await tester.pumpWidgetBuilder(
          const ProviderScope(child: Center(child: LoginPage())),
        );
        await screenMatchesGolden(tester, 'login_page');
      },
      tags: ["golden", "auth"],
    );

    testGoldens(
      'Register page',
      (tester) async {
        await tester.pumpWidgetBuilder(
          const ProviderScope(child: Center(child: RegisterPage())),
        );
        await screenMatchesGolden(tester, 'register_page');
      },
      tags: ["golden", "auth"],
    );
  });
}
