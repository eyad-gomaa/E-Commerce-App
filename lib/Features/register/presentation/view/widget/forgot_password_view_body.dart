import 'package:e_commerce1/Features/register/presentation/view/widget/custom_bottom_button.dart';
import 'package:e_commerce1/Features/register/presentation/view/widget/custom_text_form_field.dart';
import 'package:e_commerce1/core/resources/asset_manager.dart';
import 'package:e_commerce1/core/resources/style.dart';
import 'package:flutter/material.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Text(
                  "Forgot Password",
                  style: StyleManager.headLine1,
                ),
                SizedBox(
                  height: 68,
                ),
                Image.asset(AssetManager.forgotPasswordImage),
                SizedBox(
                  height: 80,
                ),
                CustomTextFormField(label: "Email Address", validator: (vale){})
              ],
            ),
          ),
        ),
        Column(
          children: [
            Text("Please write your email to receive a \n confirmation code to set a new password.",style: StyleManager.subtitle,textAlign: TextAlign.center,),
            SizedBox(height: 51),
            CustomBottomButton(onPressed: (){}, text: "Confirm Mail")
          ],
        )
      ],
    );
  }
}
