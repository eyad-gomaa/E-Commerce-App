import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/resources/app_size.dart';
import '../../../../../../core/resources/color_manager.dart';
import '../../../../data/model/category_model/datum.dart';

class BrandViewAppBar extends StatelessWidget {
  const BrandViewAppBar({Key? key, required this.brand}) : super(key: key);
final CategoryDataModel brand;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: PaddingSize.s20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: (){
            GoRouter.of(context).pop();
          }, icon: const Icon(FontAwesomeIcons.arrowLeft)),
          Container(
            width: 68,
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorManager.darkWhite
            ),
            child: Image.network(brand.image!,errorBuilder: (context, error, stackTrace) => const Icon(Icons.error_outline),fit: BoxFit.fill,),
          ),
          IconButton(onPressed: (){
            GoRouter.of(context).pop();
          }, icon: const Icon(FontAwesomeIcons.cartShopping)),

        ],
      ),
    );
  }
}
