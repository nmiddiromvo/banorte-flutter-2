import 'package:app2/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewContactButton extends StatelessWidget {
  const NewContactButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('tapped new contact');
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset('assets/add-orange.svg'),
          const SizedBox(width: 8),
          Text('Nuevo', style: AppTextStyles.buttons2),
        ],
      ),
    );
  }
}
