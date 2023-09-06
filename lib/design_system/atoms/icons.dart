import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';

class SerManosIconData {
  SerManosIconData._();

  static const IconData favorite = Icons.favorite;

  static const IconData favoriteOutline = Icons.favorite_outline;

  static const IconData search = Icons.search;

  static const IconData add = Icons.add;

  static const IconData back = Icons.arrow_back;

  static const IconData location = Icons.location_on;

  static const IconData locationOutlined = Icons.location_on_outlined;

  static const IconData locationSharp = Icons.location_on_sharp;

  static const IconData visibility = Icons.visibility;

  static const IconData visibilityOutlined = Icons.visibility_outlined;

  static const IconData visibilitySharp = Icons.visibility_sharp;

  static const IconData visibilityOff = Icons.visibility_off;

  static const IconData visibilityOffOutlined = Icons.visibility_off_outlined;

  static const IconData visibilityOffSharp = Icons.visibility_off_sharp;

  static const IconData error = Icons.error;

  static const IconData errorOutlined = Icons.error_outline;

  static const IconData errorSharp = Icons.error_sharp;

  static const IconData close = Icons.close;

  static const IconData person = Icons.person;

  static const IconData radioButtonChecked = Icons.radio_button_checked;

  static const IconData radioButtonOff = Icons.radio_button_off;

  static const IconData calendar = Icons.calendar_month;

  static const IconData nearMe = Icons.near_me;

  static const IconData list = Icons.list;

  static const IconData map = Icons.map;
}

class _BaseIcon extends Icon {
  const _BaseIcon(
    super.icon, {
    super.key,
    bool disabled = false,
    Color disabledColor = SerManosColor.neutral25,
    bool active = false,
    Color activeColor = SerManosColor.primary100,
  }) : super(
          size: 24,
          color: disabled
              ? disabledColor
              : active
                  ? activeColor
                  : SerManosColor.neutral75,
        );
}

class SerManosIcon extends _BaseIcon {
  const SerManosIcon.error(
    super.icon, {
    super.key,
    super.disabled,
    super.active,
  }) : super(activeColor: SerManosColor.error100);

  const SerManosIcon.white(
    super.icon, {
    super.key,
    super.disabled,
    super.active,
  }) : super(activeColor: SerManosColor.neutral0);

  const SerManosIcon.primary(
    super.icon, {
    super.key,
    super.disabled,
    super.active,
  }) : super();

  const SerManosIcon.secondary(
    super.icon, {
    super.key,
    super.disabled,
    super.active,
  }) : super(
          activeColor: SerManosColor.secondary200,
          disabledColor: SerManosColor.secondary80,
        );
}

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/foto de perfil.png');
  }
}

class LocationPoint extends StatelessWidget {
  const LocationPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/ubicación.png');
  }
}
