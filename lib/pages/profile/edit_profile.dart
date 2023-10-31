import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/cells/forms.dart';
import 'package:ser_manos/design_system/cells/header.dart';
import 'package:ser_manos/design_system/molecules/buttons.dart';
import 'package:ser_manos/design_system/tokens/grid.dart';

class EditProfileModal extends StatelessWidget {
  const EditProfileModal({super.key});

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
                    SerManosForm.personalData(),
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
