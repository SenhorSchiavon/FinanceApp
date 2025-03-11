import 'package:finance_app/commons/constants/app_colors.dart';
import 'package:finance_app/commons/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  const PrimaryButton({super.key, required this.text, this.onPressed});
  final BorderRadius _borderRadius = const BorderRadius.all(Radius.circular(24));
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          gradient: LinearGradient(
            colors: onPressed != null ? AppColors.greenGradient: AppColors.greyGradient,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: InkWell(
          borderRadius: _borderRadius,
          onTap: onPressed,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              text,
              style: AppTextStyles.mediumText18.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
