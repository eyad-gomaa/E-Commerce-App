import 'package:e_commerce1/Features/register/data/repos/sign_in_repo/sign_in_repo_impl.dart';
import 'package:e_commerce1/Features/register/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:e_commerce1/Features/register/presentation/view/widget/sign_In_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(repo: SignInRepoImpl()),
      child: const Scaffold(
        body: SignInViewBody(),
      ),
    );
  }
}
