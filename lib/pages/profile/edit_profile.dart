import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ser_manos/controllers/application_controllers.dart';
import 'package:ser_manos/controllers/profile_controllers.dart';
import 'package:ser_manos/design_system/cells/forms.dart';
import 'package:ser_manos/design_system/cells/header.dart';
import 'package:ser_manos/design_system/cells/modal.dart';
import 'package:ser_manos/design_system/molecules/buttons.dart';
import 'package:ser_manos/design_system/molecules/components.dart';
import 'package:ser_manos/design_system/tokens/grid.dart';
import 'package:ser_manos/models/models.dart';

class EditProfileModal extends ConsumerStatefulWidget {
  const EditProfileModal({super.key, this.volunteering});

  final Volunteering? volunteering;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditProfileModalState();
}

class _EditProfileModalState extends ConsumerState<EditProfileModal> {
  Gender? gender;
  XFile? image;
  String? imageUrl;
  ImageType imageType = ImageType.network;

  late final TextEditingController birthdate;
  late final TextEditingController phone;
  late final TextEditingController email;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final user = ref.read(profileControllerProvider).maybeWhen(
          data: (user) => user,
          orElse: () => null,
        );

    if (user == null) {
      birthdate = TextEditingController();
      phone = TextEditingController();
      email = TextEditingController();
    } else {
      birthdate = TextEditingController(text: user.birthday);
      phone = TextEditingController(text: user.phone);
      email = TextEditingController(text: user.email);
      imageUrl = user.image;
    }
    gender = user?.gender ?? Gender.male;
  }

  void setGender(Gender? gender) {
    if (gender != null) {
      setState(() => this.gender = gender);
    }
  }

  void setImage(XFile? file) {
    if (file != null) {
      setState(() {
        image = file;
        imageType = kIsWeb ? ImageType.network : ImageType.file;
        imageUrl = file.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;

    final user = ref.watch(profileControllerProvider).when(
          data: (user) => user,
          loading: () => null,
          error: (e, _) => null, // TODO: Handle error
        );

    final UpdateUserController updateUserController =
        ref.watch(updateUserControllerProvider.notifier);

    if (user == null) {
      return const CircularProgressIndicator();
    }

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
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
                        await updateUserController
                            .updateUser(
                          user.uid,
                          image,
                          birthdate.text,
                          gender,
                          phone.text,
                          email.text,
                        )
                            .then((value) {
                          if (widget.volunteering != null) {
                            applyModal(widget.volunteering!, context, ref);
                          } else {
                            context.go("/home/profile");
                          }
                        });
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

applyModal(Volunteering volunteering, BuildContext context, WidgetRef ref) {
  showSerManosModal(
    context,
    title: "Te estas por postular a",
    subtitle: volunteering.name,
    onCancel: () {
      context.pop();
      context.pop();
    },
    onConfirm: () {
      ref
          .read(applicationControllerProvider.notifier)
          .apply(volunteering.id)
          .then((_) {
        context.pop();
        context.pop();
      });
    },
  );
}
