import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/cells/header.dart';
import 'package:ser_manos/design_system/molecules/buttons.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';
import 'package:ser_manos/design_system/tokens/grid.dart';
import 'package:ser_manos/design_system/tokens/typography.dart';
import 'package:ser_manos/models/models.dart';

class NewDetailPage extends StatefulWidget {
  const NewDetailPage({super.key});

  @override
  State<StatefulWidget> createState() => _NewDetailState();
}

class _NewDetailState extends State<NewDetailPage> {
  News anew = const News(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0VmLLctGvgXcyIpZIlk_d-uZu0LRYWqvetA&usqp=CAU",
      overline: "reporte 2820",
      title: "Ser Donante Voluntario",
      subtitle:
          "Desde el Hospital Centenario recalcan la importancia de la donación voluntaria de Sangre",
      body:
          "En un esfuerzo por concienciar sobre la necesidad constante de sangre y sus componentes, el Hospital Centenario destaca la importancia de convertirse en un donante voluntario. La donación de sangre es un acto solidario y altruista que puede salvar vidas y mejorar la salud de aquellos que enfrentan enfermedades graves o accidentes. La donación voluntaria de sangre desempeña un papel vital en el sistema de salud. A diferencia de la donación de sangre por reposición, donde se solicita a familiares y amigos donar para un paciente específico, la donación voluntaria se realiza sin ninguna conexión directa con un receptor particular. Esto garantiza un suministro constante y seguro de sangre y productos sanguíneos para todos aquellos que lo necesiten. Los beneficios de ser donante voluntario son numerosos. Además de la satisfacción de ayudar a quienes más lo necesitan, la donación de sangre tiene beneficios para la salud del propio donante. Al donar sangre, se realiza un chequeo médico que incluye pruebas para detectar enfermedades transmisibles, lo que puede proporcionar una evaluación temprana y ayuda en el diagnóstico de posibles problemas de salud.");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SerManosHeader.section(title: "Novedades"),
      body: SerManosGrid(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SerManosTypography.overline(anew.overline,
                    color: SerManosColor.neutral75),
                SerManosTypography.heading2(anew.title,
                    color: SerManosColor.neutral100),
                const SizedBox(
                  height: 16,
                ),
                Image.network(anew.image, height: 160, fit: BoxFit.cover),
                const SizedBox(
                  height: 16,
                ),
                SerManosTypography.subtitle1(
                  anew.subtitle,
                  color: SerManosColor.secondary100,
                ),
                const SizedBox(
                  height: 16,
                ),
                SerManosTypography.body1(anew.body,
                    color: SerManosColor.neutral100),
                const SizedBox(
                  height: 16,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SerManosTypography.heading2("Comparte esta nota",
                      color: SerManosColor.neutral100)
                ]),
                const SizedBox(
                  height: 16,
                ),
                SerManosButton.cta(
                  "Compartir",
                  onPressed: () {},
                  fill: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
