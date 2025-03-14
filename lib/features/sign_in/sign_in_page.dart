import 'dart:developer';

import 'package:finance_app/commons/constants/app_colors.dart';
import 'package:finance_app/commons/constants/app_text_styles.dart';
import 'package:finance_app/features/sign_in/sign_in_controller.dart';
import 'package:finance_app/features/sign_in/sign_in_state.dart';
import 'package:finance_app/locator.dart';
import 'package:finance_app/services/mock_auth_service.dart';
import 'package:finance_app/widgets/custom_bottom_sheet.dart';
import 'package:finance_app/widgets/custom_circular_progress_indicator.dart';
import 'package:finance_app/widgets/custom_text_formfield.dart';
import 'package:finance_app/widgets/multi_text_button.dart';
import 'package:finance_app/widgets/password_form_field.dart';
import 'package:finance_app/widgets/primary_button.dart';
import 'package:finance_app/widgets/validator.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _controller = locator.get<SignInController>();
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
      if(_controller.state is SignInStateLoading){
        showDialog(context: context, builder: (context) => Center(child: CustomCircularProgressIndicator(),));
      }
      if(_controller.state is SignInStateSuccess){
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Scaffold(body: Center(child: Text("Nova tela"),),)));
      }
      if(_controller.state is SignInStateError){
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
          Padding(
            padding: const EdgeInsets.only(top:20.0),
            child: Text(
              "Welcome Back!",
              textAlign: TextAlign.center,
              style: AppTextStyles.mediumText.copyWith(
                color: AppColors.greenLightTwo,
              ),
            ),
          ),

          Image.asset("assets/images/sign_in_image.png"),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _emailController,
                  hintText: "Digite seu email",
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
                  _controller.SignIn(
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
                'You dont have an account? ',
                style: AppTextStyles.smallText.copyWith(color: AppColors.grey),
              ),
              Text(
                'Sign Up',
                style: AppTextStyles.smallText.copyWith(
                  color: AppColors.greenLightTwo,
                ),
              ),
            ],
            onPressed: () {
              Navigator.pushNamed(context, 'sign_up');
            },
          ),
        ],
      ),
    );
  }
}

