import 'package:flutter/material.dart';
import 'package:nooh/presentation/resources/color_manager.dart';

abstract class AppTextStyles {
  static const largeTitle25 =
      TextStyle(fontSize: 25, fontWeight: FontWeight.w700);
  static const largeTitle22 =
      TextStyle(fontSize: 22, fontWeight: FontWeight.w700);
  static const largeTitle20 =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w700);
  static const largeTitleWhite22 =
      TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white);
  static const largeTitleWhite25 =
      TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white);
  static const largeTitleWhite30 =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white);
  static const largeTitleBlack22 =
      TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.black);
  static const largeTitleWhite20 =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white);
  static const largeTitle18 =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w700);
  static const largeTitleNoOverFlow14 =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w700);
  static const largeTitle16 = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      overflow: TextOverflow.ellipsis);
  static const largeTitleLineThrough16 = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.lineThrough);
  static TextStyle largeTitleOrange14 = TextStyle(
      fontSize: 14,
      color: ColorManager.primary,
      fontWeight: FontWeight.w700,
      overflow: TextOverflow.ellipsis);
  static const largeTitleWhite16 = TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );
  static const mediumGreyTitle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Color(0xff8A8A8E),
    overflow: TextOverflow.fade,
  );
  static const mediumTitle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    overflow: TextOverflow.fade,
  );
  static const mediumAmberTitle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: Colors.amber,
  );

  static const mediumGreyTitle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: Color(0xff8A8A8E),
    overflow: TextOverflow.fade,
  );
  static const mediumWhiteTitle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    overflow: TextOverflow.fade,
  );
  static const mediumTitle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static const mediumTitleBlue14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: Colors.blue,
  );
  static const mediumTitleOrange14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: Color(0xFFFF6735),
  );
  static const mediumTitleBlack14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static const mediumTitle17 = TextStyle(
      fontSize: 17, fontWeight: FontWeight.w500, color: Color(0xff79A3D3));

  static const floatingTitle16 = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xff22292E));
  static const mediumTitleBlue16 = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xff6391F4));
}

// TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
//   return TextStyle(
//       fontSize: fontSize,
//       fontWeight: fontWeight,
//       color: color,
//       fontFamily: FontConstants.fontFamily);
// }
//
// // light
// TextStyle getLightStyle12({double fontSize = FontSize.s12, Color? color}) {
//   return _getTextStyle(fontSize, FontWeightManager.light, color!);
// }
//
// // regular
// TextStyle getRegularStyle14({double fontSize = FontSize.s14, Color? color}) {
//   return _getTextStyle(fontSize, FontWeightManager.regular, color!);
// }
//
// // medium
// TextStyle getMediumStyle16({double fontSize = FontSize.s16, Color? color}) {
//   return _getTextStyle(fontSize, FontWeightManager.medium, color!);
// }
//
// // semiBold
// TextStyle getSemiBoldStyle20({double fontSize = FontSize.s20, Color? color}) {
//   return _getTextStyle(fontSize, FontWeightManager.semiBold, color!);
// }
//
// // bold
// TextStyle getBoldStyle22({double fontSize = FontSize.s22, Color? color}) {
//   return _getTextStyle(fontSize, FontWeightManager.semiBold, color!);
// }
