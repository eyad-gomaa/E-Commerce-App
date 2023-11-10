import 'package:e_commerce1/Features/cart/presentation/manager/cart_cubit.dart';
import 'package:e_commerce1/Features/details/presentation/view/widget/details_app_bar.dart';
import 'package:e_commerce1/Features/details/presentation/view/widget/details_product_title.dart';
import 'package:e_commerce1/Features/details/presentation/view/widget/total_price_section.dart';
import 'package:e_commerce1/Features/register/presentation/view/widget/custom_bottom_button.dart';
import 'package:e_commerce1/core/resources/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/resources/app_size.dart';
import '../../../../home/data/model/product_model/product_data_model.dart';
import 'details_photos_list_view.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({Key? key, required this.product}) : super(key: key);
  final ProductDataModel product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  DetailsAppBar(product: product,),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: PaddingSize.s15,
                          horizontal: PaddingSize.s20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ************* Name and price *************
                          DetailsProductTitle(
                              productName: product.name!,
                              productPrice: product.price!),
                          //************* Product pictures *************
                          DetailsPhotosListView(imagesList: product.images,),
                          // ************* Size *************
                          // SizeListView(
                          //   size: product.,
                          // ),
                          //************* Description *************
                          // DescriptionSection(
                          //   description:
                          //   product.description!
                          // ),
                          //************* Reviews *************
                          // ReviewSection(review: product.reviews![0]),
                          //************* Total Price section *************
                          TotalPriceSection(product: product,),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //************* Add To Cart *************
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                return CustomBottomButton(
                    onPressed: () {
                      BlocProvider.of<CartCubit>(context).addOrRemoveProduct(
                          productId: product.id);
                    },
                    text: inCartMap[product.id]!
                        ? "remove from Cart"
                        : "Add to Cart"
                );
              },
            )
          ],
        ));
  }
}
