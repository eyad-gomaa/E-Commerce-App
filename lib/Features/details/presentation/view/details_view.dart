import 'package:flutter/material.dart';
import '../../../home/data/model/product_model/product_data_model.dart';
import 'widget/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({Key? key, required this.product}) : super(key: key);
  final ProductDataModel product;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: DetailsViewBody(product: product),
    );
  }
}
