import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/resources/style.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 50,
            child: TextField(
              cursorColor: ColorManager.primary,
              decoration: InputDecoration(
                  prefixIcon: const Icon(FontAwesomeIcons.magnifyingGlass),
                  prefixIconColor: ColorManager.lightGrey,
                  hintText: "Search...",
                  hintStyle: StyleManager.subtitle,
                  fillColor: ColorManager.darkWhite,
                  filled: true,
                  border: OutlineInputBorder(borderSide:  BorderSide.none,borderRadius: BorderRadius.circular(10))
              ),
            ),
          ),
        ),
        const SizedBox(width: 10,),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.primary,
                minimumSize:const Size(50, 50),
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
            ),
            onPressed: (){
            },
            child: const Icon(FontAwesomeIcons.microphone)
        ),
      ],
    );
  }
}
