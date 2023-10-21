import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/design_system/atoms/icons.dart';
import 'package:ser_manos/design_system/cells/cards.dart';
import 'package:ser_manos/design_system/cells/header.dart';
import 'package:ser_manos/design_system/cells/modal.dart';
import 'package:ser_manos/design_system/molecules/buttons.dart';
import 'package:ser_manos/design_system/molecules/components.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';
import 'package:ser_manos/design_system/tokens/grid.dart';
import 'package:ser_manos/design_system/tokens/typography.dart';
import 'package:ser_manos/models/models.dart';

class VolunteeringDetailPage extends StatefulWidget{
  const VolunteeringDetailPage({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _VolunteeringDetailState();
  }
}


class _VolunteeringDetailState extends State<VolunteeringDetailPage>{

  Volunteering volunteering = const Volunteering(purpose: "El propósito principal de \"Un techo para mi país\" es reducir el déficit habitacional y mejorar las condiciones de vida de las personas que no tienen acceso a una vivienda adecuada.", 
    activity: "Te necesitamos para construir las viviendas de las personas que necesitan un techo. Estas están prefabricadas en madera y deberás ayudar en carpintería, montaje, pintura y demás actividades de la construcción.",
     requirements: "Mayor de edad", disponibility: "Mayor de edad", 
     image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0VmLLctGvgXcyIpZIlk_d-uZu0LRYWqvetA&usqp=CAU",
        name: "Ser Donante Voluntario",
        vacant: 3,
        favorite: true);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: SerManosHeader.opacity(
        button: IconButton(
        icon: const Icon(
          SerManosIconData.back,
          color: Colors.white,
        ),
        onPressed: () => context.pop(),
      )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: Image.network(volunteering.image, fit: BoxFit.cover,))
              ],
            ),
            
          SerManosGrid(
            child: Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SerManosTypography.overline("Acción social", color: SerManosColor.neutral75),
                  SerManosTypography.heading1(volunteering.name),
                  const SizedBox(height: 16,),
                  SerManosTypography.body1(volunteering.purpose, color: SerManosColor.secondary200,),
                  const SizedBox(height: 24,),
                  SerManosTypography.heading2("Sobre la actividad"),
                  const SizedBox(height: 8,),
                  SerManosTypography.body1(volunteering.activity),
                  const SizedBox(height: 24,),
                  LocationCardWithoutMap(location: "Echeverría 3560, Capital Federal."),
                  const SizedBox(height: 24,),
                  SerManosTypography.heading2("Participar del voluntariado"),
                  const SizedBox(height: 8,),
                  SerManosTypography.subtitle1("Requisitos"),
                  const SizedBox(height: 8,),
                  SerManosTypography.body1("• ${volunteering.requirements}"),
                  const SizedBox(height: 8,),
                  SerManosTypography.subtitle1("Disponibilidad"),
                  const SizedBox(height: 8,),
                  SerManosTypography.body1("• ${volunteering.disponibility}"),
                  const SizedBox(height: 8,),
                  SerManosVacantComponent.enabled(volunteering.vacant),
                  const SizedBox(height: 24,),
                  SerManosButton.cta("Postularme", 
                  onPressed: (){
                    showDialog(context: context, builder: (context){
                    return SerManosModal(
                      context: context,
                      title: volunteering.name,
                      onConfirm: (){});
                      });

                  }, fill: true)
      
                ],
              ),),
          )
        ]),
      ),
    );
  }


}