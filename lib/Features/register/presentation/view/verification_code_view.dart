import 'package:e_commerce1/Features/register/presentation/view/widget/verification_code_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/resources/color_manager.dart';

class VerificationCodeView extends StatelessWidget {
  const VerificationCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_outlined,color: ColorManager.black,),onPressed: (){
          GoRouter.of(context).pop();
        },),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: const VerificationCodeBody(),
    );
  }
}
