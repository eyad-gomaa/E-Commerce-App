import 'package:e_commerce1/Features/cart/presentation/view/widget/cart_view_body.dart';
import 'package:e_commerce1/core/resources/color_manager.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.white,
          body: CartViewBody()
      ),
    );
  }
}
