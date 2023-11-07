import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/resources/app_size.dart';
import '../../../../../core/resources/color_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      required this.label,
      required this.validator,
        this.keyboardType,
})
      : super(key: key);
  final String label;
  final TextInputType? keyboardType;
  final String? Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType ?? TextInputType.text,
      cursorHeight: 0,
      cursorWidth: 0,
      validator: validator,
      cursorColor: ColorManager.primary,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: PaddingSize.s20),
        label: Text(label),
        labelStyle: TextStyle(
          color: ColorManager.primary,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.primary,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.primary,
          ),
        ),
      ),
    );
  }
}

class CustomPasswordTextFormField extends StatefulWidget {
  const CustomPasswordTextFormField(
      {Key? key, required this.label, required this.validator})
      : super(key: key);
  final String label;
  final String? Function(String?) validator;

  @override
  State<CustomPasswordTextFormField> createState() =>
      _CustomPasswordTextFormFieldState();
}

class _CustomPasswordTextFormFieldState
    extends State<CustomPasswordTextFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      cursorHeight: 0,
      cursorWidth: 0,
      validator: widget.validator,
      cursorColor: ColorManager.primary,
      decoration: InputDecoration(
        suffix: suffixIcon(),
        contentPadding: const EdgeInsets.symmetric(vertical: PaddingSize.s20),
        label: Text(widget.label),
        labelStyle: TextStyle(
          color: ColorManager.primary,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.primary,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.primary,
          ),
        ),
      ),
    );
  }

  suffixIcon() {
    if (obscureText == true) {
      return IconButton(
          constraints: const BoxConstraints(),
          padding: EdgeInsets.zero,
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          icon: Icon(FontAwesomeIcons.lock,color: ColorManager.primary,size: 20,));
    }else{
      return IconButton(
          constraints: const BoxConstraints(),
        padding: EdgeInsets.zero,
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          icon: Icon(FontAwesomeIcons.lockOpen,color: ColorManager.primary,size: 20,));
    }
  }
}
