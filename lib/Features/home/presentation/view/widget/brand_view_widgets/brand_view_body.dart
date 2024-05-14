import 'package:e_commerce1/core/resources/app_size.dart';
import 'package:e_commerce1/core/resources/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/resources/color_manager.dart';
import '../../../../data/model/category_model/datum.dart';
import '../../../manager/get_brand_products_cubit/get_brand_products_cubit.dart';
import '../../../manager/get_brand_products_cubit/get_brand_products_state.dart';
import '../home_view_widgets/custom_progress_indicator.dart';
import '../home_view_widgets/products_grid_view.dart';
import 'brand_view_app_bar.dart';

class BrandViewBody extends StatelessWidget {
  const BrandViewBody({Key? key, required this.brand}) : super(key: key);
  final CategoryDataModel brand;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PaddingSize.s20),
        child: Column(
          children: [
            BrandViewAppBar(
              brand: brand,
            ),
            BlocBuilder<GetBrandProductsCubit, GetBrandProductsState>(
              builder: (context, state) {
                if (state is GetBrandProductsSuccess) {

                  return Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child:Padding(
                            padding: const EdgeInsets.only(bottom: PaddingSize.s20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${state.productList.length} Items",
                                      style: StyleManager.headLine4,
                                    ),
                                    Text(
                                      "Available in stock",
                                      style: StyleManager.subtitle,
                                    ),
                                  ],
                                ),
                                Container(
                                    width: 71,
                                    height: 37,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: ColorManager.darkWhite),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.sort),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Sort",
                                          style: StyleManager.title2,
                                        )
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child:Expanded(
                              child: ProductsGridView(productList: state.productList)
                          ),
                        )
                      ],
                    ),
                  );
                } else if (state is GetBrandProductsFailure) {
                  return Text(state.errMessage);
                } else {
                  return const CustomProgressIndicator();
                }
              },
            )


          ],
        ),
      ),
    );
  }
}
