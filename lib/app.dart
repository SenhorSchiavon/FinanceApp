import 'package:finance_app/commons/themes/default_themes.dart';
import 'package:finance_app/features/onboarding/onboarding_page.dart';
import 'package:finance_app/features/sign_in/sign_in_page.dart';
import 'package:finance_app/features/sign_up/sign_up_page.dart';
import 'package:finance_app/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

import 'commons/constants/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: defaultTheme,
      initialRoute: NamedRoute.splash,
      routes: {
        NamedRoute.initial: (context) => OnboardingPage(),
        NamedRoute.splash: (context) => SplashPage(),
        NamedRoute.sign_up: (context) => SignUpPage(),
        NamedRoute.sign_in: (context) => SignInPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
