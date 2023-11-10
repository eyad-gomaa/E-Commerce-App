import 'package:flutter/cupertino.dart';

import '../../../../../core/resources/style.dart';

class DetailsProductTitle extends StatelessWidget {
  const DetailsProductTitle(
      {Key? key, required this.productName, required this.productPrice})
      : super(key: key);
  final String productName;
  final double productPrice;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "product",
              ),
              Text(
                productName,
                style: StyleManager.headLine4,
                softWrap: true,
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Price",
              style: StyleManager.subtitle,
            ),
            Text(
              "$productPrice\$",
              style: StyleManager.headLine4,
            ),
          ],
        )
      ],
    );
  }
}
