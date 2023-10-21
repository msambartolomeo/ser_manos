
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/design_system/cells/cards.dart';
import 'package:ser_manos/design_system/molecules/searchbars.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';
import 'package:ser_manos/design_system/tokens/grid.dart';
import 'package:ser_manos/design_system/tokens/typography.dart';
import 'package:ser_manos/models/models.dart';

class VolunteeringTab extends StatefulWidget{
  const VolunteeringTab({super.key});

  @override
  State<VolunteeringTab> createState() => _VolunteeringTabState();

}


class _VolunteeringTabState extends State<VolunteeringTab> {

  List<Volunteering> volunteering = const [
    Volunteering(purpose: "El propósito principal de \"Un techo para mi país\" es reducir el déficit habitacional y mejorar las condiciones de vida de las personas que no tienen acceso a una vivienda adecuada.", 
    activity: "Te necesitamos para construir las viviendas de las personas que necesitan un techo. Estas están prefabricadas en madera y deberás ayudar en carpintería, montaje, pintura y demás actividades de la construcción.",
     requirements: "Mayor de edad", disponibility: "Mayor de edad", 
     image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0VmLLctGvgXcyIpZIlk_d-uZu0LRYWqvetA&usqp=CAU",
        name: "Ser Donante Voluntario",
        vacant: 3,
        favorite: true),
       Volunteering(purpose: "El propósito principal de \"Un techo para mi país\" es reducir el déficit habitacional y mejorar las condiciones de vida de las personas que no tienen acceso a una vivienda adecuada.", 
    activity: "Te necesitamos para construir las viviendas de las personas que necesitan un techo. Estas están prefabricadas en madera y deberás ayudar en carpintería, montaje, pintura y demás actividades de la construcción.",
     requirements: "Mayor de edad", disponibility: "Mayor de edad", 
     image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0VmLLctGvgXcyIpZIlk_d-uZu0LRYWqvetA&usqp=CAU",
        name: "Ser Donante Voluntario",
        vacant: 3,
        favorite: true),
        Volunteering(purpose: "El propósito principal de \"Un techo para mi país\" es reducir el déficit habitacional y mejorar las condiciones de vida de las personas que no tienen acceso a una vivienda adecuada.", 
    activity: "Te necesitamos para construir las viviendas de las personas que necesitan un techo. Estas están prefabricadas en madera y deberás ayudar en carpintería, montaje, pintura y demás actividades de la construcción.",
     requirements: "Mayor de edad", disponibility: "Mayor de edad", 
     image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0VmLLctGvgXcyIpZIlk_d-uZu0LRYWqvetA&usqp=CAU",
        name: "Ser Donante Voluntario",
        vacant: 3,
        favorite: true),
        Volunteering(purpose: "El propósito principal de \"Un techo para mi país\" es reducir el déficit habitacional y mejorar las condiciones de vida de las personas que no tienen acceso a una vivienda adecuada.", 
    activity: "Te necesitamos para construir las viviendas de las personas que necesitan un techo. Estas están prefabricadas en madera y deberás ayudar en carpintería, montaje, pintura y demás actividades de la construcción.",
     requirements: "Mayor de edad", disponibility: "Mayor de edad", 
     image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0VmLLctGvgXcyIpZIlk_d-uZu0LRYWqvetA&usqp=CAU",
        name: "Ser Donante Voluntario",
        vacant: 3,
        favorite: true),
        Volunteering(purpose: "El propósito principal de \"Un techo para mi país\" es reducir el déficit habitacional y mejorar las condiciones de vida de las personas que no tienen acceso a una vivienda adecuada.", 
    activity: "Te necesitamos para construir las viviendas de las personas que necesitan un techo. Estas están prefabricadas en madera y deberás ayudar en carpintería, montaje, pintura y demás actividades de la construcción.",
     requirements: "Mayor de edad", disponibility: "Mayor de edad", 
     image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0VmLLctGvgXcyIpZIlk_d-uZu0LRYWqvetA&usqp=CAU",
        name: "Ser Donante Voluntario",
        vacant: 3,
        favorite: true),
        Volunteering(purpose: "El propósito principal de \"Un techo para mi país\" es reducir el déficit habitacional y mejorar las condiciones de vida de las personas que no tienen acceso a una vivienda adecuada.", 
    activity: "Te necesitamos para construir las viviendas de las personas que necesitan un techo. Estas están prefabricadas en madera y deberás ayudar en carpintería, montaje, pintura y demás actividades de la construcción.",
     requirements: "Mayor de edad", disponibility: "Mayor de edad", 
     image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0VmLLctGvgXcyIpZIlk_d-uZu0LRYWqvetA&usqp=CAU",
        name: "Ser Donante Voluntario",
        vacant: 3,
        favorite: true),
   
  ];




  @override
  Widget build(BuildContext context) {
    return Container(
      color: SerManosColor.secondary10,
      child: SerManosGrid(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            SerManosSearchBar.map(),
            const SizedBox(height: 24),
            SerManosTypography.heading1("Voluntariados", align: TextAlign.start,),


            
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.only(top: 24, bottom: 24),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return VolunteerCard(
                      image: volunteering[index].image,
                      name: volunteering[index].name,
                      vacant: volunteering[index].vacant,
                      isFavorite: volunteering[index].favorite,
                      onTapFunction: () => context.go("/volunteering_detail"),);
                },
                separatorBuilder: ((context, index) => const SizedBox(
                      height: 24,
                    )),
                itemCount: volunteering.length),
            )],
        ),
      ),
    );
  }

}