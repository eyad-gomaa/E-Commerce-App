import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/style.dart';

class SemiTransparentButton extends StatelessWidget {
  const SemiTransparentButton({
    super.key, required this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Container(
          width: 335,
          height: 50,
          decoration: BoxDecoration(
              color: const Color(0xffF5F2FF),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: ColorManager.primary, width: 2)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.squarePlus,
                color: ColorManager.primary,
                size: 20,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "Add new card",
                style:
                StyleManager.headLine3.copyWith(color: ColorManager.primary),
              )
            ],
          ),
        ),
      ),
    );
  }
}