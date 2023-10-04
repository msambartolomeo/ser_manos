import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/cells/cards.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';
import 'package:ser_manos/design_system/tokens/grid.dart';
import 'package:ser_manos/models/news.dart';

class NewsTab extends StatefulWidget {
  const NewsTab({super.key});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  List<News> news = [
    News(
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3kMFU_iePXtCvS-8Br-V0qZP_p78wFRBh8g&usqp=CAU",
        overline: "reporte 2820",
        title: "Ser Donante Voluntario",
        body:
            "Desde el Hospital Centenario recalcan la importancia de la donación voluntaria de Sangre"),
    News(
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3kMFU_iePXtCvS-8Br-V0qZP_p78wFRBh8g&usqp=CAU",
        overline: "reporte 2820",
        title: "Ser Donante Voluntario",
        body:
            "Desde el Hospital Centenario recalcan la importancia de la donación voluntaria de Sangre"),
    News(
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3kMFU_iePXtCvS-8Br-V0qZP_p78wFRBh8g&usqp=CAU",
        overline: "reporte 2820",
        title: "Ser Donante Voluntario",
        body:
            "Desde el Hospital Centenario recalcan la importancia de la donación voluntaria de Sangre"),
    News(
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3kMFU_iePXtCvS-8Br-V0qZP_p78wFRBh8g&usqp=CAU",
        overline: "reporte 2820",
        title: "Ser Donante Voluntario",
        body:
            "Desde el Hospital Centenario recalcan la importancia de la donación voluntaria de Sangre"),
    News(
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3kMFU_iePXtCvS-8Br-V0qZP_p78wFRBh8g&usqp=CAU",
        overline: "reporte 2820",
        title: "Ser Donante Voluntario",
        body:
            "Desde el Hospital Centenario recalcan la importancia de la donación voluntaria de Sangre")
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: SerManosColor.secondary10,
      child: SerManosGrid(
        child: ListView.separated(
            padding: const EdgeInsets.only(top: 32, bottom: 24),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return NewsCard(
                  image: news[index].image,
                  overline: news[index].overline,
                  title: news[index].title,
                  body: news[index].body);
            },
            separatorBuilder: ((context, index) => const SizedBox(
                  height: 24,
                )),
            itemCount: news.length),
      ),
    );
  }
}
