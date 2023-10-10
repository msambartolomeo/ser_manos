
import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/cells/cards.dart';
import 'package:ser_manos/design_system/molecules/searchbars.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';
import 'package:ser_manos/design_system/tokens/grid.dart';
import 'package:ser_manos/design_system/tokens/typography.dart';
import 'package:ser_manos/models/volunteering.dart';

class VolunteeringTab extends StatefulWidget{
  const VolunteeringTab({super.key});

  @override
  State<VolunteeringTab> createState() => _VolunteeringTabState();

}


class _VolunteeringTabState extends State<VolunteeringTab> {

  List<Volunteering> volunteering = [
    Volunteering(
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0VmLLctGvgXcyIpZIlk_d-uZu0LRYWqvetA&usqp=CAU",
        name: "Ser Donante Voluntario",
        vacant: 8,
        favorite: true),
       Volunteering(
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0VmLLctGvgXcyIpZIlk_d-uZu0LRYWqvetA&usqp=CAU",
        name: "Ser Donante Voluntario",
        vacant: 3,
        favorite: true),
        Volunteering(
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3kMFU_iePXtCvS-8Br-V0qZP_p78wFRBh8g&usqp=CAU",
        name: "Ser Donante Voluntario",
        vacant: 1,
        favorite: false),
        Volunteering(
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3kMFU_iePXtCvS-8Br-V0qZP_p78wFRBh8g&usqp=CAU",
        name: "Ser Donante Voluntario",
        vacant: 8,
        favorite: true),
        Volunteering(
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3kMFU_iePXtCvS-8Br-V0qZP_p78wFRBh8g&usqp=CAU",
        name: "Ser Donante Voluntario",
        vacant: 10,
        favorite: true),
        Volunteering(
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3kMFU_iePXtCvS-8Br-V0qZP_p78wFRBh8g&usqp=CAU",
        name: "Ser Donante Voluntario",
        vacant: 6,
        favorite: false),
        Volunteering(
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3kMFU_iePXtCvS-8Br-V0qZP_p78wFRBh8g&usqp=CAU",
        name: "Ser Donante Voluntario",
        vacant: 8,
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
                      isFavorite: volunteering[index].favorite);
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