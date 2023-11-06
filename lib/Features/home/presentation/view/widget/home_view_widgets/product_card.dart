import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce1/Features/favourite/data/repos/favourite_repo.dart';
import 'package:e_commerce1/Features/favourite/data/repos/favourite_repo_impl.dart';
import 'package:e_commerce1/Features/favourite/persintation/manager/get_cart_products_cubit/get_favourite_product_cubit.dart';
import 'package:e_commerce1/Features/home/presentation/manager/get_product_cubit/get_product_cubit.dart';
import 'package:e_commerce1/core/utils/app_router.dart';
import 'package:e_commerce1/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/resources/shared.dart';
import '../../../../../../core/resources/style.dart';
import '../../../../../../core/widgets/custom_network_image.dart';
import '../../../../data/model/product_model/product_data_model.dart';
import '../../../../data/repos/home_repo.dart';


class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductDataModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
            RouterPath.detailsView, extra: product);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(alignment: AlignmentDirectional.bottomEnd, children: [
            Container(
                width: 160,
                height: 203,
                decoration: BoxDecoration(
                  color: ColorManager.darkWhite,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: CustomNetworkImage(imgUrl: product.image!,)
            ),
            BlocBuilder<GetProductCubit, GetProductState>(
              builder: (context, state) {
                return IconButton(onPressed: () {
                  BlocProvider.of<GetProductCubit>(context)
                      .editFavouriteProductsFromHome(product.id!,);
                  // setState(() {
                  //
                  // });
                }, icon:
                inFavouritesMap[product.id]! ? Icon(
                  FontAwesomeIcons.heartCircleCheck,
                  color: ColorManager.redColor,) : Icon(
                  FontAwesomeIcons.heart, color: ColorManager.redColor,)
                );
              },
            ),
            // addToCartIcon(productId: widget.product.id,context: context,added: added),
          ]),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              product.name!,
              style: StyleManager.title3,
              maxLines: 2,
            ),
          ),
          SizedBox(height: 10,),
          Text(
            "${product.price}\$",
            style: StyleManager.headLine3,

          )
        ],
      ),
    );
  }
}