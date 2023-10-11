


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/design_system/cells/cards.dart';
import 'package:ser_manos/design_system/molecules/buttons.dart';
import 'package:ser_manos/design_system/molecules/components.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';
import 'package:ser_manos/design_system/tokens/grid.dart';
import 'package:ser_manos/design_system/tokens/typography.dart';
import 'package:ser_manos/models/profile.dart';

class FullProfileTab extends StatefulWidget{
  const FullProfileTab({super.key});
  
  @override
  State<StatefulWidget> createState() => _FullProfileTabState();

  
}

class _FullProfileTabState extends State<FullProfileTab>{

  Profile profile = Profile(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBsW1R-C7zPe66dsE_smtN6VB6ojpzwn-iMA&usqp=CAU", 
  name: "Lionel", email: "liomessi@mail.com", birthday: "10/10/2000", gender: "Hombre", phone: "+5491165863216");
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: SerManosColor.neutral0,
        child: SerManosGrid(
          child: Padding(padding: const EdgeInsets.only(bottom: 32, top: 32),
          child: Column(
            children: [
              SerManosProfilePicture.big(profile.image),
              const SizedBox(height: 16,),
              SerManosTypography.overline("Voluntario", color: SerManosColor.neutral75),
              SerManosTypography.subtitle1(profile.name, color: SerManosColor.neutral100),
              SerManosTypography.body1(profile.email, color: SerManosColor.secondary200),
              const SizedBox(height: 32,),
              CardInformation(title: "Información personal", label1: "Fecha de nacimiento", content1: profile.birthday,
              label2: "Género", content2: profile.gender),
              const SizedBox(height: 32),
              CardInformation(title: "Datos de contacto", label1: "Teléfono", content1: profile.gender,
              label2: "e-mail", content2: profile.email),
              const SizedBox(height: 32),
              SerManosButton.cta("Editar perfil", onPressed: () => context.go("/edit_profile") , fill: true),
              const SizedBox(height: 8),
              SerManosButton.ctaText("Cerrar sesión", onPressed: (){}, fill: true, color: SerManosColor.error100),
            ],
          ),),
        ),
      ),
    );
  }


}