import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../home/data/model/product_model/product_data_model.dart';

class DetailsAppBar extends StatelessWidget {
  const DetailsAppBar({Key? key, required this.product}) : super(key: key);
  final ProductDataModel product;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      backgroundColor: Colors.transparent,
      leading:  Padding(
        padding: const EdgeInsets.all(20),
        child: IconButton(
          icon:const Icon(FontAwesomeIcons.arrowLeft,),
          color: Colors.black,
          onPressed: (){
            GoRouter.of(context).pop();
          },
        ),
      ),
      actions:  [
        Padding(
          padding: const EdgeInsets.all(30),
          child: IconButton(
            icon:const Icon(FontAwesomeIcons.cartShopping,),
            color: Colors.black,
            onPressed: (){},
          ),
        ),
      ],
      expandedHeight:400 ,
      flexibleSpace: Container(
          width: double.infinity,
          decoration:  BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    product.image!)),
          )),
    );
  }
}
