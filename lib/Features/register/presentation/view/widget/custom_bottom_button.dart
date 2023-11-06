import 'package:flutter/material.dart';

import '../../../../../core/resources/color_manager.dart';

class CustomBottomButton extends StatelessWidget {
  const CustomBottomButton({Key? key,required this.onPressed, required this.text}) : super(key: key);
  final Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      height: 53,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: ColorManager.primary,shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),),
        child: Text(text),
      ),
    );
  }
}
