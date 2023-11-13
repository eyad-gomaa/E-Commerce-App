import 'package:e_commerce1/Features/payment/presentation/view/widget/payment_view_body.dart';
import 'package:e_commerce1/core/resources/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class PaymentView extends StatelessWidget {
  const PaymentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("payment",style: StyleManager.title1.copyWith(color: Colors.black),),
        leading:IconButton(icon: const Icon(Icons.arrow_back_outlined), onPressed: (){GoRouter.of(context).pop();}),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: const SafeArea(
          child: PaymentViewBody()
      ),
    );
  }
}
