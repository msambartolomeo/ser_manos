import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/atoms/icons.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';
import 'package:ser_manos/design_system/tokens/shadows.dart';
import 'package:ser_manos/design_system/tokens/text_style.dart';

class SerManosSearchBar extends Container {
  static const _baseDecoration = InputDecoration(
      hintText: "Buscar",
      hintStyle: SerManosTextStyle.subtitle1(),
      prefixIcon: SerManosIcon.primary(SerManosIconData.search),
      focusedBorder: InputBorder.none,
      border: InputBorder.none);

  static final _baseContainerDecoration = BoxDecoration(
      color: SerManosColor.neutral0,
      boxShadow: SerManosShadows.shadow1,
      borderRadius: const BorderRadius.all(Radius.circular(2)));

  SerManosSearchBar.map({super.key})
      : super(
            child: TextFormField(
                decoration: _baseDecoration.copyWith(
                    suffixIcon: const SerManosIcon.primary(SerManosIconData.map,
                        active: true)),
                style: const SerManosTextStyle.subtitle1(
                    color: SerManosColor.neutral75)),
            decoration: _baseContainerDecoration);

  SerManosSearchBar.list({super.key})
      : super(
            child: TextFormField(
                decoration: _baseDecoration.copyWith(
                    suffixIcon: const SerManosIcon.primary(
                        SerManosIconData.list,
                        active: true)),
                style: const SerManosTextStyle.subtitle1(
                    color: SerManosColor.neutral75)),
            decoration: _baseContainerDecoration);
}
