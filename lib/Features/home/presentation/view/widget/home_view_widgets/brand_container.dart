import 'package:e_commerce1/Features/home/presentation/manager/get_product_cubit/get_product_cubit.dart';
import 'package:e_commerce1/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/resources/app_size.dart';
import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/resources/style.dart';
import '../../../../data/model/category_model/datum.dart';

class BrandContainer extends StatelessWidget {
  const BrandContainer({
    Key? key,
    required this.brand,
  }) : super(key: key);
  final CategoryDataModel brand;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(RouterPath.brandView,extra:brand,
        );},
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.darkWhite,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(PaddingSize.s5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //************ Brand Image ************
              Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network(brand.image!,
                      errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error_outline);
                  })),
              const SizedBox(
                width: AppSize.s5,
              ),
              //************ Brand Name ************
              Padding(
                padding: const EdgeInsets.all(PaddingSize.s5),
                child: Text(
                  brand.name!,
                  style: StyleManager.title2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
