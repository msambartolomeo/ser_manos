import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/design_system/cells/forms.dart';
import 'package:ser_manos/design_system/cells/header.dart';
import 'package:ser_manos/design_system/molecules/buttons.dart';
import 'package:ser_manos/design_system/molecules/components.dart';
import 'package:ser_manos/design_system/tokens/grid.dart';
import 'package:ser_manos/models/models.dart';
import 'package:ser_manos/providers/current_user_provider.dart';

class EditProfileModal extends ConsumerStatefulWidget {
  const EditProfileModal({super.key, this.user});

  final User? user;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditProfileModalState();
}

class _EditProfileModalState extends ConsumerState<EditProfileModal> {
  Gender? gender;
  File? image;
  ImageType imageType = ImageType.network;

  late final TextEditingController birthdate;
  late final User? user;

  @override
  void initState() {
    super.initState();
    user = widget.user ??
        ref.read(currentUserProvider).when(
              data: (user) => user,
              loading: () => null,
              error: (e, _) => null, // TODO: Handle error
            );

    if (user == null) {
      birthdate = TextEditingController();
    } else {
      birthdate = TextEditingController(text: user?.birthday);
    }
    gender = user?.gender ?? Gender.male;
  }

  void setGender(Gender? gender) {
    if (gender != null) {
      setState(() => this.gender = gender);
    }
  }

  void setImage(File? file) {
    if (file != null) {
      setState(() {
        image = file;
        imageType = ImageType.file;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SerManosHeader.modal(),
      body: SerManosGrid(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 32),
          child: Column(
            children: [
              Flexible(
                child: ListView(
                  children: [
                    SerManosForm.personalData(
                      context: context,
                      birthdateController: birthdate,
                      selectedGender: gender,
                      onGenderChange: setGender,
                      onImageChange: setImage,
                      image: image?.path,
                      imageType: imageType,
                    ),
                    const SizedBox(height: 32),
                    SerManosForm.contactData(),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              SerManosButton.cta(
                "Guardar datos",
                onPressed: () {},
                fill: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
