import 'package:finance_app/widgets/custom_text_formfield.dart';
import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController? controller;
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String? labelText;
  final FormFieldValidator<String>? validator;
  final String? helperText;
  const PasswordFormField({super.key,  this.controller, this.padding, this.hintText, this.labelText, this.validator, this.helperText});

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.controller,
      padding: widget.padding,
      hintText: widget.hintText,
      labelText: widget.labelText,
      obscureText: isHidden,
      helperText: widget.helperText,
      validator: widget.validator,
      suffixIcon: InkWell(child: Icon(isHidden ? Icons.visibility_off : Icons.visibility, color:  isHidden ? Colors.grey : Colors.blue,),borderRadius: BorderRadius.circular(23) ,onTap: (){
        setState(() {
          isHidden = !isHidden;
        });
      },),
    );
  }
}
