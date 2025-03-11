import 'dart:developer';

import 'package:finance_app/commons/constants/app_colors.dart';
import 'package:finance_app/commons/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final TextCapitalization? textCapitalization;
  final TextInputType? keyBoardType;
  final int? maxLenght;
  final TextInputAction? textInputAction;
  final bool? obscureText;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final String? helperText;
  const CustomTextFormField({super.key,this.textCapitalization, this.controller,this.padding, this.hintText, this.labelText, this.keyBoardType, this.maxLenght,  this.textInputAction, this.suffixIcon,  this.obscureText, this.validator, this.helperText});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final defaultBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.greenLightTwo
    )
  );

  String? _helperText;
  void initState(){
    super.initState();
    _helperText = widget.helperText;
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 24,vertical: 12),
      child: TextFormField(
        onChanged: (value){
          if(value.length == 1){
            _helperText = null;
          }else if(value.isEmpty){
            _helperText = widget.helperText;
          }
        },
        obscureText: widget.obscureText ?? false,
        maxLength: widget.maxLenght,
        validator: widget.validator,
        textInputAction: widget.textInputAction,
        keyboardType: widget.keyBoardType,
        controller: widget.controller,
        textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
        decoration: InputDecoration(
          helperText: _helperText,
          helperMaxLines: 3,
          hintText: widget.hintText,
          suffixIcon: widget.suffixIcon,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText:widget.labelText?.toUpperCase(),
          labelStyle: AppTextStyles.inputLabelText.copyWith(color: AppColors.grey),
          focusedBorder: defaultBorder,
          errorBorder:defaultBorder.copyWith(
              borderSide: BorderSide(
                  color: Colors.red
              )
          ),
          focusedErrorBorder: defaultBorder,
          enabledBorder: defaultBorder,
          disabledBorder: defaultBorder,
        ),
      ),
    );
  }
}
