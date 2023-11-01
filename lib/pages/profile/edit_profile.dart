import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/design_system/cells/forms.dart';
import 'package:ser_manos/design_system/cells/header.dart';
import 'package:ser_manos/design_system/molecules/buttons.dart';
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

    gender = user?.gender ?? Gender.male;
  }

  void setGender(Gender? gender) {
    if (gender != null) {
      setState(() => this.gender = gender);
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController birthdate = TextEditingController();

    debugPrint(gender?.text);

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
