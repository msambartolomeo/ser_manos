import 'package:flutter/services.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';

class SerManosStatusBar extends SystemUiOverlayStyle {
  const SerManosStatusBar.secondary()
      : super(
          statusBarColor: SerManosColor.secondary90,
          statusBarIconBrightness: Brightness.light, // For Android (light)
          statusBarBrightness: Brightness.dark, // For iOS (light)
        );

  const SerManosStatusBar.black()
      : super(
          statusBarColor: SerManosColor.neutral100,
          statusBarIconBrightness: Brightness.light, // For Android (light)
          statusBarBrightness: Brightness.dark, // For iOS (light)
        );

  const SerManosStatusBar.white()
      : super(
          statusBarColor: SerManosColor.neutral0,
          statusBarIconBrightness: Brightness.dark, // For Android (dark)
          statusBarBrightness: Brightness.light, // For iOS (dark)
        );
}
