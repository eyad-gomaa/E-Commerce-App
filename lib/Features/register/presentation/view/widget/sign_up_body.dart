import 'package:e_commerce1/Features/register/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/resources/app_size.dart';
import '../../../../../core/resources/style.dart';
import '../../../../../core/widgets/snack_bar.dart';
import '../../../../../core/widgets/switch.dart';
import 'custom_app_bar.dart';
import 'custom_bottom_button.dart';
import 'custom_text_form_field.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final formKey = GlobalKey<FormState>();
  bool switchValue = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          if(state.userRegisterModel.status == true){
            GoRouter.of(context).push('/signInView');
          }
          else {
            showSnackBar(context: context, text: state.userRegisterModel.message);
          }
        } else if (state is SignUpFailure) {
          showSnackBar(context: context, text: state.errMessage);
        }
      },
      builder: (context, state) {
        return SafeArea(
            child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const CustomAppBar(),
                      Text("Sign Up", style: StyleManager.headLine1),
                    ],
                  ),
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(PaddingSize.s20),
                      child: Column(
                        children: [
                          CustomTextFormField(
                              label: "Username",
                              validator: (value) {
                                BlocProvider.of<SignUpCubit>(context)
                                    .name = value;
                                return null;
                              }),
                          CustomTextFormField(
                              label: "Email Address",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "required";
                                } else {
                                  BlocProvider.of<SignUpCubit>(context)
                                      .emailAddress = value;
                                  return null;
                                }
                              }),
                          CustomPasswordTextFormField(
                              label: "password",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "required";
                                } else {
                                  BlocProvider.of<SignUpCubit>(context)
                                      .password = value;
                                  return null;
                                }
                              }),
                          CustomTextFormField(
                              label: "phone",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "required";
                                } else {
                                  BlocProvider.of<SignUpCubit>(context)
                                      .phone = value;
                                  return null;
                                }
                              }),
                          const SizedBox(
                            height: AppSize.s20,
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
                          )
                        ],
                      ),
                    ),
                  ),
                  CustomBottomButton(
                    text: "Sign Up",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<SignUpCubit>(context).signUp();
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ));
      },
    );
  }
}
