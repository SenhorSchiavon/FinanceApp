
import 'dart:async';

import 'package:finance_app/commons/constants/app_text_styles.dart';
import 'package:finance_app/commons/constants/routes.dart';
import 'package:finance_app/features/onboarding/onboarding_page.dart';
import 'package:finance_app/features/sign_up/sign_up_page.dart';
import 'package:finance_app/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';

import '../../commons/constants/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}


class _SplashPageState extends State<SplashPage> {

  @override
  void initState(){
    super.initState();
    init();
  }

  Timer init(){
    return Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(context, NamedRoute.initial)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors:AppColors.greenGradient
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Finance", style: AppTextStyles.bigText.copyWith(color: AppColors.white)),
            const CustomCircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
