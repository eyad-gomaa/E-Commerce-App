import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce1/Features/home/presentation/view/widget/home_view_widgets/products_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../../core/resources/app_size.dart';
import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/resources/style.dart';
import '../../../manager/get_product_cubit/get_product_cubit.dart';


class NewArrivalSection extends StatelessWidget {
  const NewArrivalSection({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: PaddingSize.s10),
          child: Text("New Arrival",style: StyleManager.headLine3,),
        ),
        BlocBuilder<GetProductCubit, GetProductState>(
          builder: (context, state) {
            return ConditionalBuilder(
              builder:(context) => ProductsGridView(productList:BlocProvider.of<GetProductCubit>(context).productList!,),
              condition: BlocProvider.of<GetProductCubit>(context).productList != null,
              fallback:(context) =>  Shimmer.fromColors(
                baseColor: ColorManager.darkWhite,
                highlightColor: Colors.grey[100]!,
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 6,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1 / 1.8),
                  itemBuilder: (context, index) => Column(
                    mainAxisAlignment:MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 160,
                        height: 203,
                        decoration: BoxDecoration(
                          color: ColorManager.darkWhite,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: 160,
                        height: 10,
                        decoration: BoxDecoration(
                          color: ColorManager.darkWhite,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: 100,
                        height: 10,
                        decoration: BoxDecoration(
                          color: ColorManager.darkWhite,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            );
            // if(state is GetProductFailure){
            //   return Text(state.errMessage);
            // }else if(state is GetProductSuccess){
            //   return ProductsGridView(productList:state.productList,);
            // }else if(state is GetProductLoading){
            //   return Center(
            //     child: SizedBox(
            //         height: 50,
            //         width: 50,
            //         child: CircularProgressIndicator(color: ColorManager.primary,)
            //     ),
            //   );
            // }
          },
        ),

      ],
    );
  }
}
