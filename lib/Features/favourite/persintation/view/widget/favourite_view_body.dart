import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce1/Features/home/presentation/view/widget/home_view_widgets/custom_progress_indicator.dart';
import 'package:e_commerce1/core/resources/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/style.dart';
import '../../../../home/presentation/manager/get_product_cubit/get_product_cubit.dart';
import 'Favourite_card.dart';

class FavouriteViewBody extends StatefulWidget {
  const FavouriteViewBody({Key? key}) : super(key: key);

  @override
  State<FavouriteViewBody> createState() => _FavouriteViewBodyState();
}

class _FavouriteViewBodyState extends State<FavouriteViewBody> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: PaddingSize.s20),
      child: BlocConsumer<GetProductCubit, GetProductState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return ConditionalBuilder(
              condition: state is !GetFavouriteProductsLoading, //BlocProvider.of<GetProductCubit>(context).favProductList != null,
              builder: (context) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${BlocProvider
                                    .of<GetProductCubit>(context)
                                    .favProductList!
                                    .length} Items",style: StyleManager.title1,),
                                Text("in Favourites",style: StyleManager.subtitle,)
                              ],
                            ),
                            Container(
                              width: 68,
                              height: 37,
                              decoration: BoxDecoration(
                                color: ColorManager.darkWhite,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(child: Text("Edit",style: StyleManager.title1,)),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: PaddingSize.s10),
                          child: ListView.builder(
                              itemCount: BlocProvider
                                  .of<GetProductCubit>(context)
                                  .favProductList!
                                  .length,
                              itemBuilder: (context, index) =>
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: PaddingSize.s20),
                                    child: Dismissible(
                                      key: UniqueKey(),
                                      direction: DismissDirection.endToStart,
                                      background: Container(
                                        alignment: AlignmentDirectional
                                            .centerEnd,
                                        decoration: BoxDecoration(
                                          color: ColorManager.redColor,
                                          borderRadius: BorderRadius.circular(
                                              10),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(20),
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      onDismissed: (
                                          DismissDirection direction) {
                                        BlocProvider.of<GetProductCubit>(
                                            context)
                                            .editFavouriteProductsFromHomeFavourites(
                                          BlocProvider
                                              .of<GetProductCubit>(context)
                                              .favProductList![index].product!
                                              .id!,);
                                      },
                                      child: FavouriteCard(
                                        productModel: BlocProvider
                                            .of<GetProductCubit>(context)
                                            .favProductList![index],
                                      ),
                                    ),
                                  )),
                        ),
                      )
                    ],
                  );
                },
              fallback:(context) => const CustomProgressIndicator()
          );
        },
      ),
    );
  }
}
