
import 'package:e_commerce1/Features/register/presentation/view/widget/custom_bottom_button.dart';
import 'package:e_commerce1/core/resources/style.dart';
import 'package:e_commerce1/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/resources/asset_manager.dart';

class OrderConfirmedViewBody extends StatelessWidget {
  const OrderConfirmedViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width/5,
                height: MediaQuery.sizeOf(context).height/4,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage(AssetManager.orderConfirmedImage),fit: BoxFit.fill)
                ),
              ),
              const SizedBox(height: 26,),
              Text("Order Confirmed!",style: StyleManager.headLine1,),
              const SizedBox(height: 10,),
              Text("Your order has been confirmed, we will send \n you confirmation email shortly.",style: StyleManager.subtitle,textAlign: TextAlign.center),
            ],
          ),
        ),
        CustomBottomButton(onPressed: (){
          GoRouter.of(context).pushReplacement(RouterPath.selectScreen);
        }, text: "Continue Shopping")
      ],
    );
  }
}
