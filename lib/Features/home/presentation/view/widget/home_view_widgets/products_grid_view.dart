import 'package:e_commerce1/Features/home/presentation/view/widget/home_view_widgets/product_card.dart';
import 'package:flutter/material.dart';

import '../../../../data/model/product_model/product_data_model.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({Key? key, required this.productList}) : super(key: key);
  final List<ProductDataModel> productList;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) =>
          ProductCard(product: productList[index]),
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 2/3.5
      ),
      itemCount: productList.length,
    );
  }
}
