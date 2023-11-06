
import 'package:e_commerce1/Features/register/presentation/view/widget/social_buttons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/resources/app_size.dart';
import '../../../../../core/resources/style.dart';
import 'custom_app_bar.dart';
import 'custom_bottom_button.dart';

class GetStartedBody extends StatelessWidget {
  const GetStartedBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const CustomAppBar(),
              Text("Let’s Get Started",style: StyleManager.headLine1,),
            ],
          ),
          const SocialButtons(),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",style: StyleManager.subtitle,),
                  TextButton(
                      onPressed: (){
                        GoRouter.of(context).push("/signInView");
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                          splashFactory: NoSplash.splashFactory,

                      ),
                      child: Text("Signin",style: StyleManager.title2,)),
                ],
              ),
              const SizedBox(height: AppSize.s20,),
              CustomBottomButton(
                text: "Create an Account",
                onPressed: (){
                  GoRouter.of(context).push("/signUpView");
                },
              )
            ],
          )

        ],
      ),
    );
  }
}
