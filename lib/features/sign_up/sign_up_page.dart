import 'dart:developer';

import 'package:finance_app/commons/constants/app_colors.dart';
import 'package:finance_app/commons/constants/app_text_styles.dart';
import 'package:finance_app/commons/constants/routes.dart';
import 'package:finance_app/features/home/home_page.dart';
import 'package:finance_app/features/sign_up/sign_up_controller.dart';
import 'package:finance_app/features/sign_up/sign_up_state.dart';
import 'package:finance_app/locator.dart';
import 'package:finance_app/widgets/custom_bottom_sheet.dart';
import 'package:finance_app/widgets/custom_circular_progress_indicator.dart';
import 'package:finance_app/widgets/custom_text_formfield.dart';
import 'package:finance_app/widgets/multi_text_button.dart';
import 'package:finance_app/widgets/password_form_field.dart';
import 'package:finance_app/widgets/primary_button.dart';
import 'package:finance_app/widgets/validator.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _controller = locator.get<SignUpController>();
  void dispose(){
    _passwordController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener((){
      if(_controller.state is SignUpLoadingState){
        showDialog(context: context, builder: (context) => Center(child: CustomCircularProgressIndicator(),));
      }
      if(_controller.state is SignUpSuccessState){
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      }
      if(_controller.state is SignUpErrorState){
        Navigator.pop(context);
        customBottomSheetModal(context);
      }
      log(_controller.state.toString());
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text(
            "Create your",
            textAlign: TextAlign.center,
            style: AppTextStyles.mediumText.copyWith(
              color: AppColors.greenLightTwo,
            ),
          ),
          Text(
            "Account",
            textAlign: TextAlign.center,
            style: AppTextStyles.mediumText.copyWith(
              color: AppColors.greenLightTwo,
            ),
          ),
          Image.asset("assets/images/sign_up_image.png"),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _nameController,
                  hintText: "João da Silva",
                  labelText: "Your Name",
                  validator: Validator.validateName,
                ),
                CustomTextFormField(
                  controller: _emailController,
                  hintText: "joaodasilva@email.com",
                  labelText: "Your Email",
                  validator: Validator.validateMail,
                ),
                PasswordFormField(
                  controller: _passwordController,
                  labelText: "Choose your Password",
                  hintText: "********",
                  validator: Validator.validatePassword,
                  helperText: "Password must have at least 8 characters",
                ),
                PasswordFormField(
                  labelText: "Confirm your Password",
                  hintText: "********",
                  validator: (value) => Validator.validateConfirmPassword(_passwordController.text, value),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32, top: 16),
            child: PrimaryButton(
              text: "Sign up",
              onPressed: () {
                final valid =
                    _formKey.currentState != null &&
                    _formKey.currentState!.validate();
                if (valid) {
                  log("Conta cadastrada com sucesso!");
                  _controller.SignUp(
                    name: _nameController.text,
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                } else {
                  log("Erro ao cadastrar conta!");
                }
              },
            ),
          ),
          SizedBox(height: 17),

          MultiTextButtom(
            children: [
              Text(
                'Already have an account? ',
                style: AppTextStyles.smallText.copyWith(color: AppColors.grey),
              ),
              Text(
                'Log in',
                style: AppTextStyles.smallText.copyWith(
                  color: AppColors.greenLightTwo,
                ),
              ),
            ],
            onPressed: () {
              Navigator.popAndPushNamed(context, NamedRoute.sign_in);
            },
          ),
        ],
      ),
    );
  }


}



