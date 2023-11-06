import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/style.dart';
import '../../../../home/presentation/view/widget/home_view_widgets/custom_progress_indicator.dart';
import '../../manager/cart_cubit.dart';
import 'cart_view_body.dart';

class OrderInfoSection extends StatelessWidget {
  const OrderInfoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return ConditionalBuilder(
          condition:
          BlocProvider.of<CartCubit>(context).cartModel !=
              null,
          builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical:20,
                      horizontal: 20),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order Info",
                        style: StyleManager.headLine3,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          OrderInfoCard(
                              title: "Subtotal",
                              price: BlocProvider.of<CartCubit>(
                                  context)
                                  .subtotal
                                  .toString()),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10),
                            child: OrderInfoCard(
                                title: "Shipping cost",
                                price: "0"),
                          ),
                          OrderInfoCard(
                              title: "Total",
                              price:
                              (BlocProvider.of<CartCubit>(
                                  context)
                                  .subtotal!)
                                  .toString()),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            );
          },
          fallback: (context) => const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: CustomProgressIndicator(),
          ),
        );
      }
    );
  }
}
class OrderInfoCard extends StatelessWidget {
  const OrderInfoCard({
    super.key,
    required this.title,
    required this.price,
  });
  final String title;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: StyleManager.subtitle,
        ),
        const Spacer(),
        Text(
          "$price\$",
          style: StyleManager.title1,
        ),
      ],
    );
  }
}