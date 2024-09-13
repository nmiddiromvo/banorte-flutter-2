import 'package:app2/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static final AppTextStyles _instance = AppTextStyles._internal();

  factory AppTextStyles() {
    return _instance;
  }

  AppTextStyles._internal();

  static TextStyle heading2 = const TextStyle(
    fontFamily: 'Open Sans',
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 24 / 32,
    color: AppColors.white,
  );

  static TextStyle heading3 = const TextStyle(
    fontFamily: 'Open Sans',
    fontSize: 24,
    fontWeight: FontWeight.w400,
    height: 24 / 32,
    color: Colors.white,
  );

  static TextStyle heading5 = const TextStyle(
    fontFamily: 'Open Sans',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 16 / 24,
    color: Colors.white,
  );

  static TextStyle body3 = TextStyle(
    fontFamily: 'Open Sans',
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 13 / 16,
    color: Colors.white.withOpacity(0.6),
  );

  static TextStyle buttons2 = const TextStyle(
    fontFamily: 'Open Sans',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 14 / 24,
    color: Color.fromRGBO(250, 0, 255, 1),
  );

  static TextStyle buttons3 = TextStyle(
    fontFamily: 'Open Sans',
    fontSize: 13,
    fontWeight: FontWeight.w600,
    height: 16 / 13,
    color: Colors.white.withOpacity(0.8),
  );
}
