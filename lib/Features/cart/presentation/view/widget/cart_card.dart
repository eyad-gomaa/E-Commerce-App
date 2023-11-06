import 'package:e_commerce1/Features/cart/data/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/resources/app_size.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/style.dart';
import '../../../../../core/widgets/custom_network_image.dart';
import '../../manager/cart_cubit.dart';

class CartCard extends StatelessWidget {
  const CartCard({Key? key, required this.cartItem, required this.index})
      : super(key: key);
  final CartItem cartItem;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: PaddingSize.s20, vertical: PaddingSize.s10),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          GestureDetector(
            onTap: () {
              // GoRouter.of(context)
              //     .push(RouterPath.detailsView, extra: productModel);
            },
            child: Container(
              width: MediaQuery.sizeOf(context).width - 40,
              height: 140,
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.darkWhite,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                    // Shadow position
                  ),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(PaddingSize.s10),
                    child: Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        color: ColorManager.darkWhite,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: CustomNetworkImage(
                        imgUrl: cartItem.product!.image!,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width - 200,
                            child: Text(
                              cartItem.product!.name!,
                              style: StyleManager.title1,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // BlocBuilder<CartCubit, CartState>(
                          //   builder: (context, state) {
                          //     return Row(
                          //       children: [
                          //         Row(
                          //           crossAxisAlignment:
                          //               CrossAxisAlignment.center,
                          //           children: [
                          //             IconButton(
                          //                 onPressed: () {},
                          //                 icon: Icon(
                          //                   FontAwesomeIcons.minus,
                          //                   size: 20,
                          //                   color: ColorManager.lightGrey,
                          //                 )),
                          //             Text(
                          //               BlocProvider.of<CartCubit>(context)
                          //                   .itemCountIncrement(index)
                          //                   .toString(),
                          //               style: StyleManager.title1,
                          //             ),
                          //             IconButton(
                          //                 onPressed: () {
                          //                   BlocProvider.of<CartCubit>(context)
                          //                       .itemCountIncrement(index);
                          //                 },
                          //                 icon: Icon(
                          //                   FontAwesomeIcons.plus,
                          //                   size: 20,
                          //                   color: ColorManager.lightGrey,
                          //                 ))
                          //           ],
                          //         ),
                          //         const SizedBox(
                          //           width: 20,
                          //         ),
                          //         Text(
                          //           "${cartItem.product!.price}\$",
                          //           style: StyleManager.subtitle,
                          //         ),
                          //       ],
                          //     );
                          //   },
                          // ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(PaddingSize.s20),
            child: GestureDetector(
              onTap: () async {
                await BlocProvider.of<CartCubit>(context)
                    .addOrRemoveProduct(productId: cartItem.product!.id);
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  border: Border.all(
                    color: ColorManager.redColor,
                    width: 1.0,
                  ),
                ),
                child: Icon(
                  Icons.delete_outline_rounded,
                  size: 20,
                  color: ColorManager.redColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
