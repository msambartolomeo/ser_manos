import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ser_manos/controllers/application_controllers.dart';
import 'package:ser_manos/controllers/favorites_controller.dart';
import 'package:ser_manos/controllers/profile_controllers.dart';
import 'package:ser_manos/controllers/volunteering_controllers.dart';
import 'package:ser_manos/pages/volunteerings/volunteering.dart';
import 'package:ser_manos/pages/volunteerings/volunteering_detail.dart';
import 'package:ser_manos/providers/geolocation_provider.dart';

import 'mocks/controllers/news_controller.dart';
import 'mocks/controllers/profile_controller.dart';
import 'mocks/controllers/volunteering_controler.dart';
import 'mocks/image_http.dart';
import 'mocks/models/volunteering_mock.dart';

void main() {
  getVolunteeringDetailWidget() {
    return Localizations(
      locale: const Locale('en', 'US'),
      delegates: const <LocalizationsDelegate<dynamic>>[
        DefaultWidgetsLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
      ],
      child: ProviderScope(
        overrides: [
          // ignore: scoped_providers_should_specify_dependencies
          volunteeringControllerProvider
              .getProviderOverride(volunteeringControllerProvider.call(null))
              .overrideWith(() => VolunteeringControllerMock()),
          // ignore: scoped_providers_should_specify_dependencies
          determineGeolocationProvider.overrideWith((ref) => Future.error("")),
          volunteeringStreamProvider
              .overrideWith((ref) => volunteeringStreamProviderMock(ref)),
          // ignore: scoped_providers_should_specify_dependencies
          applicationControllerProvider
              .overrideWith(() => ApplicationControllerMock()),
          // ignore: scoped_providers_should_specify_dependencies
          favoritesControllerProvider
              .overrideWith(() => FavoritesControllerMock()),
          // ignore: scoped_providers_should_specify_dependencies
          profileControllerProvider
              .overrideWith(() => CompleteProfileControllerMock()),
        ],
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: MaterialApp(
            home: VolunteeringDetailPage(
              volunteering: volunteeringMock,
              id: volunteeringMock.id,
            ),
          ),
        ),
      ),
    );
  }

  getVolunteeringWidget() {
    return Localizations(
      locale: const Locale('en', 'US'),
      delegates: const <LocalizationsDelegate<dynamic>>[
        DefaultWidgetsLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
      ],
      child: ProviderScope(
        overrides: [
          // ignore: scoped_providers_should_specify_dependencies
          volunteeringControllerProvider
              .getProviderOverride(volunteeringControllerProvider.call(null))
              .overrideWith(() => VolunteeringControllerMock()),
          // ignore: scoped_providers_should_specify_dependencies
          determineGeolocationProvider.overrideWith((ref) => Future.error("")),
          volunteeringStreamProvider
              .overrideWith((ref) => volunteeringStreamProviderMock(ref)),
          // ignore: scoped_providers_should_specify_dependencies
          applicationControllerProvider
              .overrideWith(() => ApplicationControllerMock()),
          // ignore: scoped_providers_should_specify_dependencies
          favoritesControllerProvider
              .overrideWith(() => FavoritesControllerMock())
        ],
        child: const MaterialApp(
          home: VolunteeringTab(),
        ),
      ),
    );
  }

  group("Volunteering golden tests", () {
    setUp(() async {
      registerFallbackValue(Uri());

      // Load an image from assets and transform it from bytes to List<int>
      final imageByteData =
          await rootBundle.load('assets/logo rectangular.png');
      final imageIntList = imageByteData.buffer.asInt8List();

      final requestsMap = {
        Uri.parse(imageUrl): imageIntList,
      };

      HttpOverrides.global = MockHttpOverrides(requestsMap);
    });

    testGoldens(
      'Volunteering list test - Phone',
      (tester) async {
        final builder = DeviceBuilder()
          ..overrideDevicesForAllScenarios(devices: [Device.phone])
          ..addScenario(
            widget: getVolunteeringWidget(),
            name: 'default page',
          );
        await tester.pumpDeviceBuilder(builder);
        await screenMatchesGolden(
          tester,
          'volunteerings_phone',
        );
      },
      tags: ["golden", "volunteering"],
    );

    testGoldens(
      'Volunteering list test - Iphone',
      (tester) async {
        final builder = DeviceBuilder()
          ..overrideDevicesForAllScenarios(devices: [Device.phone])
          ..addScenario(
            widget: getVolunteeringWidget(),
            name: 'default page',
          );
        await tester.pumpDeviceBuilder(builder);
        await screenMatchesGolden(
          tester,
          'volunteerings_iphone',
        );
      },
      tags: ["golden", "volunteering"],
    );

    testGoldens(
      'Volunteering list test - Iphone',
      (tester) async {
        final builder = DeviceBuilder()
          ..overrideDevicesForAllScenarios(devices: [Device.tabletLandscape])
          ..addScenario(
            widget: getVolunteeringWidget(),
            name: 'default page',
          );
        await tester.pumpDeviceBuilder(builder);
        await screenMatchesGolden(
          tester,
          'volunteerings_tablet_ls',
        );
      },
      tags: ["golden", "volunteering"],
    );

    testGoldens(
      'Volunteering list test - Iphone',
      (tester) async {
        final builder = DeviceBuilder()
          ..overrideDevicesForAllScenarios(devices: [Device.tabletPortrait])
          ..addScenario(
            widget: getVolunteeringWidget(),
            name: 'default page',
          );
        await tester.pumpDeviceBuilder(builder);
        await screenMatchesGolden(
          tester,
          'volunteerings_tablet_p',
        );
      },
      tags: ["golden", "volunteering"],
    );

    testGoldens(
      'Volunteering detail test - Phone',
      (tester) async {
        final builder = DeviceBuilder()
          ..overrideDevicesForAllScenarios(devices: [Device.phone])
          ..addScenario(
            widget: getVolunteeringDetailWidget(),
            name: 'default page',
          );
        await tester.pumpDeviceBuilder(builder);
        await screenMatchesGolden(
          tester,
          'volunteerings_detail_phone',
        );
      },
      tags: ["golden", "volunteering"],
    );

    testGoldens(
      'Volunteering detail test - Iphone',
      (tester) async {
        final builder = DeviceBuilder()
          ..overrideDevicesForAllScenarios(devices: [Device.phone])
          ..addScenario(
            widget: getVolunteeringDetailWidget(),
            name: 'default page',
          );
        await tester.pumpDeviceBuilder(builder);
        await screenMatchesGolden(
          tester,
          'volunteerings_detail_iphone',
        );
      },
      tags: ["golden", "volunteering"],
    );

    testGoldens(
      'Volunteering detail test - Iphone',
      (tester) async {
        final builder = DeviceBuilder()
          ..overrideDevicesForAllScenarios(devices: [Device.tabletLandscape])
          ..addScenario(
            widget: getVolunteeringDetailWidget(),
            name: 'default page',
          );
        await tester.pumpDeviceBuilder(builder);
        await screenMatchesGolden(
          tester,
          'volunteerings_detail_tablet_ls',
        );
      },
      tags: ["golden", "volunteering"],
    );

    testGoldens(
      'Volunteering detail test - Iphone',
      (tester) async {
        final builder = DeviceBuilder()
          ..overrideDevicesForAllScenarios(devices: [Device.tabletPortrait])
          ..addScenario(
            widget: getVolunteeringDetailWidget(),
            name: 'default page',
          );
        await tester.pumpDeviceBuilder(builder);
        await screenMatchesGolden(
          tester,
          'volunteerings_detail_tablet_p',
        );
      },
      tags: ["golden", "volunteering"],
    );
  });
}
