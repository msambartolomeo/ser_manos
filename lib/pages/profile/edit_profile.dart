import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/controllers/profile_controllers.dart';
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
  String? imageUrl;
  ImageType imageType = ImageType.network;

  late final User? user;
  late final TextEditingController birthdate;
  late final TextEditingController phone;
  late final TextEditingController email;

  final _formKey = GlobalKey<FormState>();

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
      phone = TextEditingController();
      email = TextEditingController();
    } else {
      birthdate = TextEditingController(text: user?.birthday);
      phone = TextEditingController(text: user?.phone);
      email = TextEditingController(text: user?.email);
      imageUrl = user?.image;
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
        imageUrl = file.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;

    ref.watch(updateUserControllerProvider).maybeWhen(
          orElse: () => {},
          loading: () => isLoading = true,
          error: (e, _) => {}, // TODO: Handle error
        );

    final UpdateUserController updateUserController =
        ref.watch(updateUserControllerProvider.notifier);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: SerManosHeader.modal(),
        body: Form(
          key: _formKey,
          child: SerManosGrid(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 32),
              child: Column(
                children: [
                  Flexible(
                    child: ListView(
                      children: [
                        SerManosForm.personalData(
                          enabled: !isLoading,
                          context: context,
                          birthdateController: birthdate,
                          selectedGender: gender,
                          onGenderChange: setGender,
                          onImageChange: setImage,
                          image: imageUrl,
                          imageType: imageType,
                        ),
                        const SizedBox(height: 32),
                        SerManosForm.contactData(
                          enabled: !isLoading,
                          phoneController: phone,
                          emailController: email,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  SerManosButton.cta(
                    disabled: isLoading,
                    "Guardar datos",
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await updateUserController.updateUser(
                          user!.uid,
                          image,
                          birthdate.text,
                          gender,
                          phone.text,
                          email.text,
                        );
                      }
                    },
                    fill: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
