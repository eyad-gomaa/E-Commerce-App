
import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';

class StyleManager {
  static TextStyle headLine1 = TextStyle(
     fontWeight: FontWeightManager.bold,
    fontSize: FontSize.s28,
  );

  static TextStyle headLine2 = TextStyle(
    fontWeight: FontWeightManager.semiBold,
    fontSize: FontSize.s25,
  );

  static TextStyle headLine3 = TextStyle(
    fontWeight: FontWeightManager.semiBold,
    fontSize: FontSize.s17,

  );static TextStyle headLine4 = TextStyle(
    fontWeight: FontWeightManager.semiBold,
    fontSize: FontSize.s22,
  );

  static TextStyle title1 = TextStyle(
    fontWeight: FontWeightManager.bold,
    fontSize: FontSize.s15,
  );
  static TextStyle title2 = TextStyle(
    fontWeight: FontWeightManager.bold,
    color: ColorManager.black,
    fontSize: FontSize.s13,
  );
  static TextStyle title3 = TextStyle(
    fontWeight: FontWeightManager.semiBold,
    fontSize: FontSize.s11,
  );

  static TextStyle subtitle = TextStyle(
    fontWeight: FontWeightManager.regular,
    fontSize: FontSize.s15,
    color: ColorManager.lightGrey
  );
  static TextStyle subtitle2 = TextStyle(
    fontWeight: FontWeightManager.regular,
    fontSize: FontSize.s11,
    color: ColorManager.lightGrey
  );

  static TextStyle whiteButtonText = TextStyle(
      fontWeight: FontWeightManager.medium,
      fontSize: FontSize.s17,
      color: ColorManager.lightGrey
  );

  static TextStyle purpleButtonText = TextStyle(
      fontWeight: FontWeightManager.medium,
      fontSize: FontSize.s17,
      color: ColorManager.white
  );
}