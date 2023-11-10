import 'package:e_commerce1/Features/cart/presentation/view/widget/payment_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/resources/app_size.dart';
import '../../../../../core/resources/style.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../register/presentation/view/widget/custom_bottom_button.dart';
import 'AddressSection.dart';
import 'cart_products_section.dart';
import 'order_info_section.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //********************* Page AppBar Section **********************
        Padding(
          padding: const EdgeInsets.symmetric(vertical: PaddingSize.s20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Cart",
                style: StyleManager.title1,
              )
            ],
          ),
        ),
        //********************* Details Section **********************
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               const Expanded(
                child: CustomScrollView(

                  slivers: [
                    //********************* Cart Products Section **********************
                    SliverToBoxAdapter(
                        child: CartProductsSection()
                    ),
                    //********************* Address Section **********************

                    SliverToBoxAdapter(
                        child: AddressSection()),

                    //********************* Payment Section **********************

                    SliverToBoxAdapter(
                        child: PaymentSection()),

                    //********************* Order Info Section **********************

                    SliverToBoxAdapter(
                        child: OrderInfoSection()),
                  ],
                ),
              ),
              //********************* Check Out Button **********************
              CustomBottomButton(onPressed: () {
                GoRouter.of(context).push(RouterPath.orderConfirmedView);
              }, text: "Check Out"),
            ],
          ),
        ),
      ],
    );
  }
}



