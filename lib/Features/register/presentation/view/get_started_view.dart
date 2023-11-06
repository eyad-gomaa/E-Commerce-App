import 'package:flutter/material.dart';
import '../../data/repos/google_signin_repo/google_signin_repo_impl.dart';
import '../manager/google_signin_cubit/google_sign_in_cubit.dart';
import 'widget/get_started_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class GetStartedView extends StatelessWidget {
  const GetStartedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoogleSignInCubit(googleRepo:GoogleRepoImpl()),
      child: const Scaffold(
        body: GetStartedBody(),
      ),
    );
  }
}
