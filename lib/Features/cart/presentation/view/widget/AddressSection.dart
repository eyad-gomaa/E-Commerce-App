// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../../../../core/resources/style.dart';
import 'cart_details.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Delivery Address",
            style: StyleManager.headLine3,
          ),
          const CartDetailsCard(
            title: "Chhatak, Sunamgonj 12/8AB",
            img: "assets/images/map.png",
            subTitle: "Sylhet",
          )
        ],
      ),
    );
  }
}