import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
        subtitle:
            "Desde el Hospital Centenario recalcan la importancia de la donación voluntaria de Sangre",
        body:
            "En un esfuerzo por concienciar sobre la necesidad constante de sangre y sus componentes, el Hospital Centenario destaca la importancia de convertirse en un donante voluntario. La donación de sangre es un acto solidario y altruista que puede salvar vidas y mejorar la salud de aquellos que enfrentan enfermedades graves o accidentes. La donación voluntaria de sangre desempeña un papel vital en el sistema de salud. A diferencia de la donación de sangre por reposición, donde se solicita a familiares y amigos donar para un paciente específico, la donación voluntaria se realiza sin ninguna conexión directa con un receptor particular. Esto garantiza un suministro constante y seguro de sangre y productos sanguíneos para todos aquellos que lo necesiten. Los beneficios de ser donante voluntario son numerosos. Además de la satisfacción de ayudar a quienes más lo necesitan, la donación de sangre tiene beneficios para la salud del propio donante. Al donar sangre, se realiza un chequeo médico que incluye pruebas para detectar enfermedades transmisibles, lo que puede proporcionar una evaluación temprana y ayuda en el diagnóstico de posibles problemas de salud."),
    News(
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3kMFU_iePXtCvS-8Br-V0qZP_p78wFRBh8g&usqp=CAU",
        overline: "reporte 2820",
        title: "Ser Donante Voluntario",
        subtitle:
            "Desde el Hospital Centenario recalcan la importancia de la donación voluntaria de Sangre",
        body:
            "En un esfuerzo por concienciar sobre la necesidad constante de sangre y sus componentes, el Hospital Centenario destaca la importancia de convertirse en un donante voluntario. La donación de sangre es un acto solidario y altruista que puede salvar vidas y mejorar la salud de aquellos que enfrentan enfermedades graves o accidentes. La donación voluntaria de sangre desempeña un papel vital en el sistema de salud. A diferencia de la donación de sangre por reposición, donde se solicita a familiares y amigos donar para un paciente específico, la donación voluntaria se realiza sin ninguna conexión directa con un receptor particular. Esto garantiza un suministro constante y seguro de sangre y productos sanguíneos para todos aquellos que lo necesiten. Los beneficios de ser donante voluntario son numerosos. Además de la satisfacción de ayudar a quienes más lo necesitan, la donación de sangre tiene beneficios para la salud del propio donante. Al donar sangre, se realiza un chequeo médico que incluye pruebas para detectar enfermedades transmisibles, lo que puede proporcionar una evaluación temprana y ayuda en el diagnóstico de posibles problemas de salud."),
    News(
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3kMFU_iePXtCvS-8Br-V0qZP_p78wFRBh8g&usqp=CAU",
        overline: "reporte 2820",
        title: "Ser Donante Voluntario",
        subtitle:
            "Desde el Hospital Centenario recalcan la importancia de la donación voluntaria de Sangre",
        body:
            "En un esfuerzo por concienciar sobre la necesidad constante de sangre y sus componentes, el Hospital Centenario destaca la importancia de convertirse en un donante voluntario. La donación de sangre es un acto solidario y altruista que puede salvar vidas y mejorar la salud de aquellos que enfrentan enfermedades graves o accidentes. La donación voluntaria de sangre desempeña un papel vital en el sistema de salud. A diferencia de la donación de sangre por reposición, donde se solicita a familiares y amigos donar para un paciente específico, la donación voluntaria se realiza sin ninguna conexión directa con un receptor particular. Esto garantiza un suministro constante y seguro de sangre y productos sanguíneos para todos aquellos que lo necesiten. Los beneficios de ser donante voluntario son numerosos. Además de la satisfacción de ayudar a quienes más lo necesitan, la donación de sangre tiene beneficios para la salud del propio donante. Al donar sangre, se realiza un chequeo médico que incluye pruebas para detectar enfermedades transmisibles, lo que puede proporcionar una evaluación temprana y ayuda en el diagnóstico de posibles problemas de salud."),
    News(
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3kMFU_iePXtCvS-8Br-V0qZP_p78wFRBh8g&usqp=CAU",
        overline: "reporte 2820",
        title: "Ser Donante Voluntario",
        subtitle:
            "Desde el Hospital Centenario recalcan la importancia de la donación voluntaria de Sangre",
        body:
            "En un esfuerzo por concienciar sobre la necesidad constante de sangre y sus componentes, el Hospital Centenario destaca la importancia de convertirse en un donante voluntario. La donación de sangre es un acto solidario y altruista que puede salvar vidas y mejorar la salud de aquellos que enfrentan enfermedades graves o accidentes. La donación voluntaria de sangre desempeña un papel vital en el sistema de salud. A diferencia de la donación de sangre por reposición, donde se solicita a familiares y amigos donar para un paciente específico, la donación voluntaria se realiza sin ninguna conexión directa con un receptor particular. Esto garantiza un suministro constante y seguro de sangre y productos sanguíneos para todos aquellos que lo necesiten. Los beneficios de ser donante voluntario son numerosos. Además de la satisfacción de ayudar a quienes más lo necesitan, la donación de sangre tiene beneficios para la salud del propio donante. Al donar sangre, se realiza un chequeo médico que incluye pruebas para detectar enfermedades transmisibles, lo que puede proporcionar una evaluación temprana y ayuda en el diagnóstico de posibles problemas de salud."),
    News(
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3kMFU_iePXtCvS-8Br-V0qZP_p78wFRBh8g&usqp=CAU",
        overline: "reporte 2820",
        title: "Ser Donante Voluntario",
        subtitle:
            "Desde el Hospital Centenario recalcan la importancia de la donación voluntaria de Sangre",
        body:
            "En un esfuerzo por concienciar sobre la necesidad constante de sangre y sus componentes, el Hospital Centenario destaca la importancia de convertirse en un donante voluntario. La donación de sangre es un acto solidario y altruista que puede salvar vidas y mejorar la salud de aquellos que enfrentan enfermedades graves o accidentes. La donación voluntaria de sangre desempeña un papel vital en el sistema de salud. A diferencia de la donación de sangre por reposición, donde se solicita a familiares y amigos donar para un paciente específico, la donación voluntaria se realiza sin ninguna conexión directa con un receptor particular. Esto garantiza un suministro constante y seguro de sangre y productos sanguíneos para todos aquellos que lo necesiten. Los beneficios de ser donante voluntario son numerosos. Además de la satisfacción de ayudar a quienes más lo necesitan, la donación de sangre tiene beneficios para la salud del propio donante. Al donar sangre, se realiza un chequeo médico que incluye pruebas para detectar enfermedades transmisibles, lo que puede proporcionar una evaluación temprana y ayuda en el diagnóstico de posibles problemas de salud.")
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: SerManosColor.secondary10,
      child: ListView.separated(
          padding: const EdgeInsets.only(top: 32, bottom: 24),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return SerManosGrid(
              child: NewsCard(
                image: news[index].image,
                overline: news[index].overline,
                title: news[index].title,
                subtitle: news[index].subtitle,
                //TODO: replace id with real id
                onPressedFunction: () => context.go("/home/news/id"),
              ),
            );
          },
          separatorBuilder: ((context, index) => const SizedBox(
                height: 24,
              )),
          itemCount: news.length),
    );
  }
}
