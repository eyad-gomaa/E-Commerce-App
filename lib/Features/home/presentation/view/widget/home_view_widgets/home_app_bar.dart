import 'package:e_commerce1/core/resources/style.dart';
import 'package:e_commerce1/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/resources/color_manager.dart';


class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      toolbarHeight: 60,
      automaticallyImplyLeading: false,
      pinned: true,
      elevation: 0,
      leading: IconButton(
          iconSize: 20,
          onPressed: (){
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(
            FontAwesomeIcons.barsStaggered,
            color: ColorManager.black,

          )),
      centerTitle: true,
      title:Text("Laza",style: StyleManager.headLine1.copyWith(color:ColorManager.primary),),
      actions: [
        IconButton(
            iconSize: 20,
            onPressed: (){
              GoRouter.of(context).push(RouterPath.cartView);
            },
            icon:  Icon(
              FontAwesomeIcons.cartShopping,
              color: ColorManager.black,
            )),
      ],
    );
  }
}
