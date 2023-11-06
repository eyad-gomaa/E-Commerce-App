import 'package:e_commerce1/Features/register/data/repos/sign_up_repo/sign_up_repo_impl.dart';
import 'package:e_commerce1/Features/register/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:e_commerce1/Features/register/presentation/view/widget/sign_up_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(repo: SignUpRepoImpl()),
      child: const Scaffold(
          body: SignUpBody()
      ),
    );
  }
}
