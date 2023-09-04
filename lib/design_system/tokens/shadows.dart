import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';

abstract final class SerManosShadows {
  static List<BoxShadow> shadow1 = [
    BoxShadow(
      color: SerManosColor.black.withOpacity(.15),
      blurRadius: 3,
      spreadRadius: 1,
      offset: const Offset(
        0,
        1,
      ),
    ),
    BoxShadow(
      color: SerManosColor.black.withOpacity(.30),
      blurRadius: 2,
      spreadRadius: 0,
      offset: const Offset(
        0, 
        1,
      ),
    ),
  ];

  static List<BoxShadow> shadow2 = [
    BoxShadow(
      color: SerManosColor.black.withOpacity(.15),
      blurRadius: 6.0,
      spreadRadius: 2.0,
      offset: const Offset(
        0.0,
        2.0,
      ),
    ),
    BoxShadow(
      color: SerManosColor.black.withOpacity(.30),
      blurRadius: 2.0,
      spreadRadius: 0.0,
      offset: const Offset(
        0.0,
        1.0,
      ),
    ),
  ];

  static List<BoxShadow> shadow3 = [
    BoxShadow(
      color: SerManosColor.black.withOpacity(.30),
      blurRadius: 4.0,
      spreadRadius: 0.0,
      offset: const Offset(
        0.0,
        4.0,
      ),
    ),
    BoxShadow(
      color: SerManosColor.black.withOpacity(0.15),
      blurRadius: 12.0,
      spreadRadius: 6.0,
      offset: const Offset(
        0.0,
        8.0,
      ),
    ),
  ];
}
