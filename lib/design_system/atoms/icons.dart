import 'package:flutter/material.dart';

class SerManosIcons{

   SerManosIcons._();

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


class ProfilePicture extends StatelessWidget{
  const ProfilePicture({super.key});


  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/foto de perfil.png');
  }

}


class LocationPoint extends StatelessWidget{
  const LocationPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/ubicación.png');
  }

}

