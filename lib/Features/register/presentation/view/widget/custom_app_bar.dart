import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/resources/app_size.dart';
import '../../../../../core/resources/color_manager.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(PaddingSize.s20),
      child: Row(
        children: [
          CircleAvatar(
              backgroundColor: ColorManager.darkWhite,
              child: IconButton(onPressed: () {
                GoRouter.of(context).pop();
              },
                  icon: Icon(FontAwesomeIcons.arrowLeft, color: ColorManager.black,))),
        ],
      ),
    );


  }
}
