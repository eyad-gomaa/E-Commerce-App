import 'package:e_commerce1/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/resources/asset_manager.dart';
import '../../../../../core/resources/style.dart';
import 'custom_bottom_button.dart';
import 'custom_text_form_field.dart';

class VerificationCodeBody extends StatelessWidget {
  const VerificationCodeBody({Key? key}) : super(key: key);

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
                const SizedBox(height: 20,),
                Text(
                  "Verification Code",
                  style: StyleManager.headLine1,
                ),
                const SizedBox(
                  height: 68,
                ),
                Image.asset(AssetManager.forgotPasswordImage),
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 77,
                        height: 98,
                        child: TextFormField(
                          onChanged: (value){
                            if(value.length ==1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          cursorColor: ColorManager.primary,
                          keyboardType: TextInputType.number,
                          style: StyleManager.headLine1,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],

                          decoration: InputDecoration(
                            enabled: true,
                             border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                                 borderSide: BorderSide(color: ColorManager.lightGrey)),
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: ColorManager.primary)),
                          ),
                        )),
                    SizedBox(width: 20,),
                    SizedBox(
                      width: 77,
                        height: 98,
                        child: TextFormField(
                          onChanged: (value){
                            if(value.length ==1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          cursorColor: ColorManager.primary,
                          keyboardType: TextInputType.number,
                          style: StyleManager.headLine1,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],

                          decoration: InputDecoration(
                            enabled: true,
                             border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                                 borderSide: BorderSide(color: ColorManager.lightGrey)),
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: ColorManager.primary)),
                          ),
                        )),
                    SizedBox(width: 20,),
                    SizedBox(
                        width: 77,
                        height: 98,
                        child: TextFormField(
                          onChanged: (value){
                            if(value.length ==1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          cursorColor: ColorManager.primary,
                          keyboardType: TextInputType.number,
                          style: StyleManager.headLine1,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],

                          decoration: InputDecoration(
                            enabled: true,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: ColorManager.lightGrey)),
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: ColorManager.primary)),
                          ),
                        )),
                    SizedBox(width: 20,),
                    SizedBox(
                        width: 77,
                        height: 98,
                        child: TextFormField(
                          onChanged: (value){
                            if(value.length ==1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          cursorColor: ColorManager.primary,
                          keyboardType: TextInputType.number,
                          style: StyleManager.headLine1,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],

                          decoration: InputDecoration(
                            enabled: true,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: ColorManager.lightGrey)),
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: ColorManager.primary)),
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
        Column(
          children: [
            Text("resend confirmation code.",style: StyleManager.subtitle,textAlign: TextAlign.center,),
            const SizedBox(height: 51),
            CustomBottomButton(onPressed: (){}, text: "Confirm Code")
          ],
        )
      ],
    );
  }
}
