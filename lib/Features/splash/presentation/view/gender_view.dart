import 'package:e_commerce1/Features/splash/presentation/view/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/resources/app_size.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style.dart';

class GenderView extends StatelessWidget {
  const GenderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(PaddingSize.s10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 100),
                      child: SizedBox(
                          width: MediaQuery.sizeOf(context).width / 2,
                          child: Image.asset(
                              "assets/images/ecommerce_checkout.png")),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 260,
                decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.circular(AppSize.s20)),
                child: Padding(
                  padding: const EdgeInsets.all(PaddingSize.s15),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: AppSize.s10,
                      ),
                      Text("You want, You get", style: StyleManager.headLine2),
                      const SizedBox(
                        height: AppSize.s14,
                      ),
                      Text(
                        "get whatever you want with some taps on the screen.",
                        style: StyleManager.subtitle,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: AppSize.s14,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                            text: "Men",
                            color: ColorManager.darkWhite,
                            textStyle: StyleManager.whiteButtonText,
                            onPressed: () {
                              setGender("men");
                              GoRouter.of(context).push("/getStarted");
                            },
                          ),
                          const SizedBox(
                            width: AppSize.s5,
                          ),
                          CustomButton(
                            text: "Women",
                            color: ColorManager.primary,
                            textStyle: StyleManager.purpleButtonText,
                            onPressed: () {
                              setGender("women");
                              GoRouter.of(context).push("/getStarted");
                            },
                          ),
                        ],
                      ),
                      TextButton(
                          onPressed: () {
                            GoRouter.of(context).push("/getStarted");
                          },
                          style: TextButton.styleFrom(
                              splashFactory: NoSplash.splashFactory),
                          child: Text(
                            "Skip",
                            style: StyleManager.subtitle,
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

setGender(String gender) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('gender', gender);
}
