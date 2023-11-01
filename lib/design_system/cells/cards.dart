import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/atoms/icons.dart';
import 'package:ser_manos/design_system/molecules/buttons.dart';
import 'package:ser_manos/design_system/molecules/components.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';
import 'package:ser_manos/design_system/tokens/shadows.dart';
import 'package:ser_manos/design_system/tokens/typography.dart';
import 'package:ser_manos/models/models.dart';

class VolunteerCard extends InkWell {
  VolunteerCard(
      {super.key,
      required String image,
      required String name,
      required int vacant,
      required bool isFavorite,
      required void Function() onTapFunction})
      : super(
            onTap: onTapFunction,
            child: Container(
                decoration: BoxDecoration(
                  color: SerManosColor.neutral0,
                  borderRadius: const BorderRadius.all(Radius.circular(2.0)),
                  boxShadow: SerManosShadows.shadow2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.network(image, height: 138, fit: BoxFit.cover),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SerManosTypography.overline("acción social",
                                    color: SerManosColor.neutral75),
                                SerManosTypography.subtitle1(name,
                                    color: SerManosColor.neutral100),
                                const SizedBox(height: 4),
                                vacant ==
                                        0 //habria que ver si se deshabilita con 0 o con otra condicion
                                    ? SerManosVacantComponent.disabled(vacant)
                                    : SerManosVacantComponent.enabled(vacant),
                              ],
                            )),
                            Row(children: [
                              isFavorite
                                  ? const SerManosIcon.primary(
                                      SerManosIconData.favorite,
                                      active: true)
                                  : const SerManosIcon.primary(
                                      SerManosIconData.favoriteOutline,
                                      active: true),
                              const SizedBox(width: 16),
                              const SerManosIcon.primary(
                                  SerManosIconData.location,
                                  active: true)
                            ])
                          ],
                        ))
                  ],
                )));
}

class NewsCard extends Container {
  NewsCard(
      {super.key,
//      required ImageProvider<Object> image,
      required String image,
      required String overline,
      required String title,
      required String subtitle,
      required dynamic onPressedFunction})
      : super(
            decoration: BoxDecoration(
              color: SerManosColor.neutral0,
              borderRadius: const BorderRadius.all(Radius.circular(2.0)),
              boxShadow: SerManosShadows.shadow2,
            ),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.network(image, width: 118, fit: BoxFit.cover),
                  Expanded(
                    child: Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, top: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SerManosTypography.overline(overline,
                                color: SerManosColor.neutral75),
                            SerManosTypography.subtitle1(title,
                                color: SerManosColor.neutral100),
                            SerManosTypography.body2(subtitle,
                                color: SerManosColor.neutral75,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SerManosButton.ctaText("Leer Más",
                                    onPressed: onPressedFunction)
                              ],
                            )
                          ],
                        )),
                  )
                ],
              ),
            ));
}

class CurrentVolunteerCard extends Container {
  CurrentVolunteerCard({
    super.key,
    required String overline,
    required String title,
  }) : super(
            decoration: BoxDecoration(
                color: SerManosColor.primary5,
                borderRadius: const BorderRadius.all(Radius.circular(2.0)),
                boxShadow: SerManosShadows.shadow2,
                border: const Border.fromBorderSide(
                    BorderSide(color: SerManosColor.primary100, width: 2))),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SerManosTypography.overline(overline,
                          color: SerManosColor.neutral75),
                      SerManosTypography.subtitle1(title,
                          color: SerManosColor.neutral100)
                    ],
                  )),
                  const SerManosIcon.primary(SerManosIconData.location,
                      active: true)
                ],
              ),
            ));
}

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
    this.image,
    this.imageType,
    required this.onImageChange,
    this.enabled = true,
  });

  final String? image;
  final ImageType? imageType;
  final void Function(File? image) onImageChange;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return switch (image == null || imageType == null) {
      true => EmptyProfilePictureCard(
          onImageChange: onImageChange,
          enabled: enabled,
        ),
      false => FullProfilePictureCard(
          image: image!,
          imageType: imageType!,
          onImageChange: onImageChange,
          enabled: enabled,
        ),
    };
  }
}

class EmptyProfilePictureCard extends Container {
  EmptyProfilePictureCard({
    super.key,
    required void Function(File? image) onImageChange,
    bool enabled = true,
  }) : super(
          decoration: const BoxDecoration(
              color: SerManosColor.secondary25,
              borderRadius: BorderRadius.all(Radius.circular(2.0))),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Row(
              children: [
                Expanded(
                  child: SerManosTypography.subtitle1(
                    "Foto de perfil",
                    color: SerManosColor.neutral100,
                  ),
                ),
                const SizedBox(width: 8),
                SerManosButton.cta(
                  "Subir foto",
                  disabled: !enabled,
                  onPressed: () async {
                    FilePickerResult? result = await FilePicker.platform
                        .pickFiles(type: FileType.image);

                    if (result != null) {
                      File file = File(result.files.single.path!);
                      onImageChange(file);
                    }
                  },
                )
              ],
            ),
          ),
        );
}

class FullProfilePictureCard extends Container {
  FullProfilePictureCard({
    super.key,
    required String image,
    required ImageType imageType,
    required void Function(File? image) onImageChange,
    bool enabled = true,
  }) : super(
          decoration: const BoxDecoration(
            color: SerManosColor.secondary25,
            borderRadius: BorderRadius.all(Radius.circular(2.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SerManosTypography.subtitle1(
                        "Foto de perfil",
                        color: SerManosColor.neutral100,
                      ),
                      const SizedBox(height: 8),
                      SerManosButton.cta(
                        "Cambiar foto",
                        disabled: !enabled,
                        onPressed: () async {
                          FilePickerResult? result = await FilePicker.platform
                              .pickFiles(type: FileType.image);

                          if (result != null) {
                            File file = File(result.files.single.path!);
                            onImageChange(file);
                          }
                        },
                      )
                    ],
                  ),
                ),
                SerManosProfilePicture.small(image, type: imageType),
              ],
            ),
          ),
        );
}

class _BaseCardInformation extends Container {
  _BaseCardInformation(
      {super.key, required String title, required Widget information})
      : super(
            child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: const BoxDecoration(
                color: SerManosColor.secondary25,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                SerManosTypography.subtitle1(
                  title,
                  color: SerManosColor.neutral100,
                )
              ]),
            ),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: const BoxDecoration(
                  color: SerManosColor.neutral10,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                ),
                child: information),
          ],
        ));
}

class CardInformation extends _BaseCardInformation {
  CardInformation(
      {super.key,
      required super.title,
      required String label1,
      required String label2,
      required String content1,
      required String content2})
      : super(
          information: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SerManosTypography.overline(label1,
                      color: SerManosColor.neutral75),
                  SerManosTypography.body1(content1),
                  const SizedBox(
                    height: 8,
                  ),
                  SerManosTypography.overline(label2,
                      color: SerManosColor.neutral75),
                  SerManosTypography.body1(content2),
                ],
              )
            ],
          ),
        );
}

class GenderCard extends _BaseCardInformation {
  GenderCard({
    super.key,
    required Gender? selectedGender,
    required void Function(Gender?) onGenderChange,
  }) : super(
          title: "Información de perfil",
          information: Column(
            children: [
              RadioListTile<Gender>(
                title: Text(Gender.male.text),
                groupValue: selectedGender,
                value: Gender.male,
                onChanged: onGenderChange,
              ),
              RadioListTile<Gender>(
                selected: true,
                title: Text(Gender.female.text),
                groupValue: selectedGender,
                value: Gender.female,
                onChanged: onGenderChange,
              ),
              RadioListTile<Gender>(
                title: Text(Gender.nonBinary.text),
                groupValue: selectedGender,
                value: Gender.nonBinary,
                onChanged: onGenderChange,
              ),
            ],
          ),
        );

  static updateGender(TextEditingController controller, Gender? value) {
    if (value != null) {
      controller.text = value.text;
    }
  }
}

class LocationCardWithoutMap extends _BaseCardInformation {
  LocationCardWithoutMap({super.key, required String location})
      : super(
            title: "Ubicación",
            information: Row(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SerManosTypography.overline("Dirección",
                        color: SerManosColor.neutral75),
                    SerManosTypography.body1(location)
                  ],
                )),
                const SerManosIcon.primary(SerManosIconData.location,
                    active: true)
              ],
            ));
}
