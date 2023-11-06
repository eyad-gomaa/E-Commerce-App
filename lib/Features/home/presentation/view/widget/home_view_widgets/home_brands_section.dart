import 'package:e_commerce1/Features/home/presentation/manager/get_brand_cubit/get_brand_cubit.dart';
import 'package:e_commerce1/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../../core/resources/app_size.dart';
import '../../../../../../core/resources/style.dart';
import '../../../manager/get_brand_cubit/get_brand_state.dart';
import 'brands_list_view.dart';
class HomeBrandsSection extends StatelessWidget {
  const HomeBrandsSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: PaddingSize.s20),
          child: Text(
            "Choose Brand",
            style: StyleManager.headLine3,
          ),
        ),
        // Brand Container
        BlocBuilder<GetBrandCubit, GetBrandState>(
          builder: (context, state) {
            if(state is GetBrandSuccess){
              return BrandsListView(brandList: state.brandList,);
            }else if(state is GetBrandFailure){
              return Center(child: Text(state.errMessage));
            }else{
              return Shimmer.fromColors(
                baseColor: ColorManager.darkWhite,
                highlightColor: Colors.grey[100]!,
                child: const BrandsShimmer()
              );
            }
          },
        )
      ],
    );
  }
}

class BrandsShimmer extends StatelessWidget {
  const BrandsShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (context, index) => Card(
            margin: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: const SizedBox(height: 50,width: 115,),
          )
      ),
    );
  }
}
