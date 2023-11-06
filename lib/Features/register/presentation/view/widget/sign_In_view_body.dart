import 'package:e_commerce1/Features/register/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:e_commerce1/Features/register/presentation/view/widget/custom_app_bar.dart';
import 'package:e_commerce1/Features/register/presentation/view/widget/custom_bottom_button.dart';
import 'package:e_commerce1/Features/register/presentation/view/widget/custom_text_form_field.dart';
import 'package:e_commerce1/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/resources/app_size.dart';
import '../../../../../core/resources/style.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/snack_bar.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({Key? key}) : super(key: key);

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final formKey = GlobalKey<FormState>();
  String? email;
  bool switchValue = true;
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        if(state is SignInFailure){

          showSnackBar(context: context, text: state.errMessage);

        }else if(state is SignInSuccess){

         if(state.userLoginModel.status == true){

           saveLoginToken(switchValue,state.userLoginModel.data.token!);
           GoRouter.of(context).push(RouterPath.selectScreen);
         }else{
           showSnackBar(context: context, text: (state.userLoginModel.message));
         }
        }
      },
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Title and AppBar
                  Column(
                    children: [
                      const CustomAppBar(),
                      Text("Welcome", style: StyleManager.headLine1),
                      Text("Please enter your data to continue",
                          style: StyleManager.subtitle),
                    ],
                  ),
                  // Form
                  Padding(
                    padding: const EdgeInsets.all(PaddingSize.s20),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                              label: "email",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "required";
                                } else {
                                  BlocProvider.of<SignInCubit>(context)
                                      .emailAddress = value;
                                  email = value;
                                  return null;
                                }
                              }),
                          CustomPasswordTextFormField(
                              label: "password",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "required";
                                } else {
                                  BlocProvider.of<SignInCubit>(context)
                                      .password = value;
                                  return null;
                                }
                              }),
                          const SizedBox(
                            height: AppSize.s20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Forgot password?",
                                    style: StyleManager.title1
                                        .copyWith(color: ColorManager.redColor),
                                  ))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Remember me",
                                style: StyleManager.title1,
                              ),
                              Switch(
                                value: switchValue,
                                onChanged: (value) {
                                  setState(() {
                                    switchValue = value;
                                  });
                                },
                                activeTrackColor: Colors.green,
                                activeColor: Colors.white,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Button
                  CustomBottomButton(
                    text: "Login",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<SignInCubit>(context).signIn();
                      }
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
saveLoginToken(switchValue,String token)async{
  if(switchValue){
    final SharedPreferences sharedPref =
    await SharedPreferences.getInstance();
    await sharedPref.setString("token", token);
  }
}
}
