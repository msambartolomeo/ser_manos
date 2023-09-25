import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/atoms/icons.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';
import 'package:ser_manos/design_system/tokens/typography.dart';

class _BaseVacantComponent extends Card{

  _BaseVacantComponent(int vacantes, {super.key , required Color backgroundColor, required Color textVacantColor, required Icon icon}) 
  :super(
    margin: const EdgeInsets.all(0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    color: backgroundColor,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SerManosTypography.body2("Vacantes:", color: SerManosColor.neutral100,),
          const SizedBox(width: 8.0),
          icon,
          SerManosTypography.subtitle1('$vacantes', color: textVacantColor)
        ]
      )
    )
  );
}


class SerManosVacantComponent extends _BaseVacantComponent{

  SerManosVacantComponent.enabled(super.vacantes, {super.key})
  :super(
    backgroundColor: SerManosColor.secondary25,
    textVacantColor: SerManosColor.secondary200,
    icon: const SerManosIcon.secondary(SerManosIconData.person, active: true, disabled: false)
  );

  SerManosVacantComponent.disabled(super.vacantes, {super.key})
  :super(
    backgroundColor: SerManosColor.neutral25,
    textVacantColor: SerManosColor.secondary80,
    icon: const SerManosIcon.secondary(SerManosIconData.person, active: true, disabled: true)
  );
}


class _BaseProfilePicture extends ClipOval{

  _BaseProfilePicture(ImageProvider<Object> image, {required double width, required double height})
  :super(
    child: Image(
      image: image,
      width: width,
      height: height,
      fit: BoxFit.cover,)
  );
}

class SerManosProfilePicture extends _BaseProfilePicture{
  SerManosProfilePicture.small(super.image)
  :super(
    width: 84,
    height: 84
  );

  SerManosProfilePicture.big(super.image)
  :super(
    width: 110,
    height: 110
  );
}



