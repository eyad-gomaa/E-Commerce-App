import 'package:flutter/material.dart';

import '../../../../../core/resources/app_size.dart';

class CustomSocialButton extends StatelessWidget {
  const CustomSocialButton({Key? key, required this.color, required this.image, this.onTap}) : super(key: key);
final Color color;
final String image;
final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 335,
        height: 48.53,
        constraints: const BoxConstraints(
          maxHeight: 48.53,
          maxWidth: 335,
        ),
        decoration: BoxDecoration(
          color: color,
              borderRadius: BorderRadius.circular(AppSize.s10),
        ),
        child: Image.asset(image),
      ),
    );
  }
}
