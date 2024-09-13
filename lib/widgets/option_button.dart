import 'package:app2/common/gradient_box_border.dart';
import 'package:app2/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({
    super.key,
    this.onTap,
    required this.title,
    required this.svgPath,
  });

  final VoidCallback? onTap;
  final String title;
  final String svgPath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: const GradientBoxBorder(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                Color.fromRGBO(251, 54, 255, 0.6),
                Color.fromRGBO(251, 54, 255, 0),
              ],
            ),
          ),
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(42, 45, 50, 1),
              Color.fromRGBO(35, 38, 42, 1)
            ],
          ),
        ),
        child: Column(
          children: [
            SvgPicture.asset(svgPath),
            const SizedBox(height: 4),
            Text(title, style: AppTextStyles.buttons3),
          ],
        ),
      ),
    );
  }
}
