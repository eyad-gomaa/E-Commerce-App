import 'package:e_commerce1/Features/home/data/model/BrandModel.dart';
import 'package:e_commerce1/core/resources/app_size.dart';
import 'package:flutter/material.dart';

import '../../../../data/model/category_model/datum.dart';
import 'brand_container.dart';

class BrandsListView extends StatelessWidget {
  const BrandsListView({Key? key, required this.brandList}) : super(key: key);
  final List<CategoryDataModel> brandList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => BrandContainer(
          brand: brandList[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: AppSize.s10,
        ),
        itemCount:brandList.length,
      ),
    );
  }
}
