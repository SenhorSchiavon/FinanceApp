import 'package:finance_app/commons/constants/app_colors.dart';
import 'package:finance_app/commons/constants/app_text_styles.dart';
import 'package:finance_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
void customBottomSheetModal(BuildContext context) {
  showModalBottomSheet(context: context, builder: (BuildContext context){
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(38),
          topRight: Radius.circular(38),
        ),
      ),
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text('Ops, deu errado!',style: AppTextStyles.mediumText18.copyWith(color: AppColors.greenLightOne),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: PrimaryButton(text: 'Tentar novamente', onPressed: (){
                Navigator.pop(context);
              },),
            ),

          ],
        ),
      ),
    );
  });
}