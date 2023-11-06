import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.color, required this.text, required this.textStyle, this.onPressed}) : super(key: key);
final Color color;
final String text;
final TextStyle textStyle;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            minimumSize: const Size(152, 60),
          elevation: 0,


        ),
        child: Text(text,style:textStyle),
    );
  }
}
