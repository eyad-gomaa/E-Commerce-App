import 'package:e_commerce1/core/resources/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/resources/app_size.dart';
import '../../../../../core/resources/color_manager.dart';

class CartDetailsCard extends StatelessWidget {
  const CartDetailsCard({Key? key, required this.img, required this.title, required this.subTitle}) : super(key: key);
final String img;
final String title;
final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 90,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(10),

      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(PaddingSize.s10),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: ColorManager.darkWhite,
                borderRadius: BorderRadius.circular(10),
              ),
              child:  Image.asset(
                img,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(PaddingSize.s10),
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width-200,
                    child: Text(
                      title,
                      style: StyleManager.title2,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    subTitle,
                    style: StyleManager.subtitle,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              border: Border.all(
                color: Colors.green,
                width: 1.0,
              ),
            ),
            child: const Icon(FontAwesomeIcons.check,size: 15,color: Colors.green,),
          ),
        ],
      ),
    );
  }
}
