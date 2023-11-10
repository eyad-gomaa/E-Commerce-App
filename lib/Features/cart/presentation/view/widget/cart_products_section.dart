import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../manager/cart_cubit.dart';
import 'cart_card.dart';

class CartProductsSection extends StatelessWidget {
  const CartProductsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      width: MediaQuery.sizeOf(context).width,
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return ConditionalBuilder(
            condition:
            BlocProvider.of<CartCubit>(context).cartModel !=
                null,
            builder: (context) {
              if (BlocProvider.of<CartCubit>(context)
                  .cartModel!
                  .data!
                  .cartItems
                  .isNotEmpty) {
                return ConditionalBuilder(
                  condition:
                  state is AddOrRemoveProductSuccessState ||
                      state is CartSuccessState,
                  builder: (context) => ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount:
                      BlocProvider.of<CartCubit>(context)
                          .cartModel!
                          .data!
                          .cartItems
                          .length,
                      itemBuilder: (context, index) => CartCard(
                        cartItem:
                        BlocProvider.of<CartCubit>(
                            context)
                            .cartModel!
                            .data!
                            .cartItems[index],
                        index: index,
                      )),
                  fallback: (context) => const CartProductsShimmer()
                  // const Padding(
                  //   padding: EdgeInsets.only(top: 8.0),
                  //   child: CustomProgressIndicator(),
                  // ),
                );
              } else {
                return const Center(
                    child: Text("No Items In Cart"));
              }
            },
            fallback: (context) => const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: CartProductsShimmer(),
            ),
          );
        },
      ),
    );
  }
}

class CartProductsShimmer extends StatelessWidget {
  const CartProductsShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        itemCount: 2,
          itemBuilder:(context, index) =>  Card(
            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: const SizedBox(height: 140),
          )
      )
    );
  }
}