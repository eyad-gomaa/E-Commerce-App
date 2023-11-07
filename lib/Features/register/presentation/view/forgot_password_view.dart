import 'package:e_commerce1/Features/register/presentation/view/widget/forgot_password_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_outlined,color: ColorManager.black,),onPressed: (){},),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ForgotPasswordViewBody(),
    );
  }
}
