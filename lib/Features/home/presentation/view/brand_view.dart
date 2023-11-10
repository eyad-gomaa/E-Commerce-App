import 'package:e_commerce1/Features/home/data/repos/details_repo.dart';
import 'package:e_commerce1/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/category_model/datum.dart';
import '../manager/get_brand_products_cubit/get_brand_products_cubit.dart';
import 'widget/brand_view_widgets/brand_view_body.dart';

class BrandView extends StatelessWidget {
  const BrandView({Key? key, required this.brand,}) : super(key: key);
  final CategoryDataModel brand;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create:(context) => GetBrandProductsCubit(getIt<DetailsRepo>())..getBrandProducts(categoryId: brand.id!),),
        ],
        child: BrandViewBody(brand: brand),
      ),
    );
  }
}
