
import 'package:finance_app/commons/constants/app_colors.dart';
import 'package:finance_app/commons/constants/routes.dart';
import 'package:finance_app/features/sign_up/sign_up_page.dart';
import 'package:finance_app/widgets/multi_text_button.dart';
import 'package:finance_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import '../../commons/constants/app_text_styles.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.iceWhite,
      body: Align(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 48),
            Expanded( child: Image.asset("assets/images/onboarding_image.png")),

            Text(
              "Spend Smarter",
              textAlign: TextAlign.center,
              style: AppTextStyles.mediumText.copyWith(
                color: AppColors.greenLightTwo,
              ),
            ),
            Text(
              "Save More",
              textAlign: TextAlign.center,
              style: AppTextStyles.mediumText.copyWith(
                color: AppColors.greenLightTwo,
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 32, right: 32, top: 16),
              child: PrimaryButton(text: "Get Started", onPressed: () {
                Navigator.pushReplacementNamed(context, NamedRoute.sign_up);
              }),
            ),
            SizedBox(height: 17),
         
            MultiTextButtom(children: [
              Text('Already have an account? ',
                  style: AppTextStyles.smallText.copyWith(
                    color: AppColors.grey,
                  )),
              Text('Log in',
                  style: AppTextStyles.smallText.copyWith(
                    color: AppColors.greenLightTwo,
                  )),
            ],onPressed: (){
              Navigator.pushNamed(context, NamedRoute.sign_in);

            },
            ),


            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
