import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/resources/app_size.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/style.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/custom_network_image.dart';
import '../../../../home/data/model/product_model/product_data_model.dart';
import '../../../../home/data/model/product_model/product_model.dart';
import '../../../data/model/favourite_model.dart';

class FavouriteCard extends StatelessWidget {
  const FavouriteCard({Key? key, required this.productModel}) : super(key: key);
  final FavouriteDataModel productModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(RouterPath.detailsView, extra: productModel);
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
                  imgUrl: productModel.product!.image!,
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
                      width: MediaQuery.sizeOf(context).width-200,
                      child: Text(
                        productModel.product!.name!,
                        style: StyleManager.title1,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${productModel.product!.price!} \$",
                      style: StyleManager.subtitle,
                    ),
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
    );
  }
}
