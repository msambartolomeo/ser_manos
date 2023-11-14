import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ser_manos/controllers/news_controllers.dart';
import 'package:ser_manos/pages/news/news.dart';
import 'package:ser_manos/pages/news/news_detail.dart';

import 'mocks/controllers/news_controller.dart';
import 'mocks/image_http.dart';
import 'mocks/models/news_mock.dart';

void main() {
  group("News golden tests", () {
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
      'Empty news list test',
      (tester) async {
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
                newsGetAllControllerProvider
                    .overrideWith((ref) => newsGetAllEmptyControllerMock(ref))
              ],
              child: Overlay(
                // overlay configuration and entries go here
                initialEntries: [
                  OverlayEntry(
                    builder: (context) => const Directionality(
                      textDirection: TextDirection.ltr,
                      child: Material(
                        child: NewsTab(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
        await screenMatchesGolden(tester, 'empty_news_tab');
      },
      tags: ["golden", "news"],
    );
    testGoldens('News tab test', (WidgetTester tester) async {
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
              newsGetAllControllerProvider
                  .overrideWith((ref) => newsGetAllControllerMock(ref))
            ],
            child: const Directionality(
              textDirection: TextDirection.ltr,
              child: Material(
                child: NewsTab(),
              ),
            ),
          ),
        ),
      );

      await screenMatchesGolden(tester, 'news_tab');
    }, tags: ["golden", "news"]);
  });

  testGoldens(
    'News detail test',
    (tester) async {
      await tester.pumpWidget(
        Localizations(
          locale: const Locale('en', 'US'),
          delegates: const <LocalizationsDelegate<dynamic>>[
            DefaultWidgetsLocalizations.delegate,
            DefaultMaterialLocalizations.delegate,
          ],
          child: ProviderScope(
            child: Overlay(
              // overlay configuration and entries go here
              initialEntries: [
                OverlayEntry(
                  builder: (context) => Directionality(
                    textDirection: TextDirection.ltr,
                    child: Material(
                      child: NewsDetailPage(
                        news: newsMock,
                        id: newsMock.id,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      await screenMatchesGolden(tester, 'news_detail_tab');
    },
    tags: ["golden", "news"],
  );
}
