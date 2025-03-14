
import 'dart:async';
import 'dart:developer';

import 'package:finance_app/commons/constants/app_text_styles.dart';
import 'package:finance_app/commons/constants/routes.dart';
import 'package:finance_app/features/onboarding/onboarding_page.dart';
import 'package:finance_app/features/sign_up/sign_up_page.dart';
import 'package:finance_app/features/splash/splash_controller.dart';
import 'package:finance_app/features/splash/splash_state.dart';
import 'package:finance_app/locator.dart';
import 'package:finance_app/services/secure_storage.dart';
import 'package:finance_app/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';

import '../../commons/constants/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}


class _SplashPageState extends State<SplashPage> {
  final _splashController = locator.get<SplashController>();
  @override
  void initState(){
    super.initState();
    _splashController.isUserLogged();
    _splashController.addListener(() {

      if(_splashController.state is SplashStateSuccess) {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, NamedRoute.home);
        }

      if(_splashController.state is SplashStateError){
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, NamedRoute.initial);
      }
    });
  }

  @override
  void dispose(){
    _splashController.dispose();
    super.dispose();
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
