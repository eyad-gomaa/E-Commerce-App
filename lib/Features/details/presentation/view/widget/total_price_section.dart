import 'package:flutter/material.dart';
import '../../../../../core/resources/style.dart';
import '../../../../home/data/model/product_model/product_data_model.dart';
class TotalPriceSection extends StatelessWidget {
  const TotalPriceSection({Key? key,required this.product}) : super(key: key);
  final ProductDataModel product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text("Total Price",style: StyleManager.headLine3,),
              Text("with VAT,SD",style: StyleManager.subtitle2,),
            ],
          ),
          Text("${product.price}\$",style: StyleManager.headLine3,),
        ],
      ),
    );
  }
}
