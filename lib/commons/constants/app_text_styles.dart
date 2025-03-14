import 'package:flutter/material.dart';

class AppTextStyles{
  AppTextStyles._();
  static const TextStyle bigText = TextStyle(
      fontSize: 50,
      fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
  );
  static const TextStyle mediumText = TextStyle(
    fontSize: 36,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
  );
  static const TextStyle mediumText18 = TextStyle(
    fontSize: 18,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  );
  static const TextStyle smallText = TextStyle(
    fontSize: 14,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );
  static const TextStyle inputLabelText = TextStyle(
    fontSize: 14,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );
}