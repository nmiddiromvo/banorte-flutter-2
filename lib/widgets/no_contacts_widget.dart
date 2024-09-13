import 'package:app2/styles/app_text_styles.dart';
import 'package:app2/widgets/new_contact_button.dart';
import 'package:flutter/material.dart';

class NoContactsWidget extends StatelessWidget {
  const NoContactsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Contactos', style: AppTextStyles.heading3),
        SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              Text('No tienes contactos', style: AppTextStyles.heading5),
              const SizedBox(height: 8),
              Text(
                'Agrega uno para transferir más rápido',
                style: AppTextStyles.body3,
              ),
              const SizedBox(height: 16),
              const NewContactButton(),
            ],
          ),
        )
      ],
    );
  }
}
