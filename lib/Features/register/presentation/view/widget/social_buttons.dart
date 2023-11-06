import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/app_size.dart';
import '../../../../../core/resources/asset_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../manager/google_signin_cubit/google_sign_in_cubit.dart';
import 'custom_button.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Facebook Button
        CustomSocialButton(
          onTap: (){},
          color: ColorManager.facebookColor,
          image: AssetManager.facebookImage,
        ),
        const SizedBox(height: AppSize.s10,),
        // Twitter Button
        CustomSocialButton(
          onTap: (){},
          color: ColorManager.twitterColor,
          image: AssetManager.twitterImage,
        ),
        const SizedBox(height: AppSize.s10,),
        //Google Button
        CustomSocialButton(
          onTap: (){
            BlocProvider.of<GoogleSignInCubit>(context).signInWithGoogle();
          },
          color: ColorManager.googleColor,
          image: AssetManager.googleImage,
        ),
      ],
    );
  }
}
