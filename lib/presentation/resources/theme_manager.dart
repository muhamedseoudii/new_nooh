import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nooh/presentation/resources/color_manager.dart';
import 'package:nooh/presentation/resources/styles_manager.dart';
import 'package:nooh/presentation/resources/values_manager.dart';

class ThemeClass {
  // Color lightPrimaryColor = const Color(0xFFFF6735);
  // Color darkPrimaryColor = const Color(0xFFFF6735);
  // Color secondaryColor = const Color(0xffFF8B6A);
  // Color accentColor = const Color(0xffFFD2BB);

  ThemeData get lightTheme => ThemeData(
        primaryColor: ColorManager.primary,
        primaryColorLight: ColorManager.lightPrimary,
        primaryColorDark: ColorManager.darkPrimary,
        disabledColor: ColorManager.grey,
        // splashColor: ColorManager.lightPrimary,
        colorScheme: const ColorScheme.light().copyWith(
          primary: ColorManager.primary,
          secondary: ColorManager.darkPrimary,
          surface: ColorManager.white,
          brightness: Brightness.light,
        ),
        fontFamily: GoogleFonts.cairo().fontFamily,
        //appBar theme
        appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(color: Colors.white),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.r),
                  bottomRight: Radius.circular(25.r))),
          centerTitle: false,
          color: ColorManager.primary,
          elevation: AppSize.s3,
          shadowColor: ColorManager.lightPrimary,
          titleTextStyle: AppTextStyles.largeTitle20,
        ),
        //cardView Theme
        cardTheme: CardTheme(
          color: Colors.white,
          shadowColor: ColorManager.grey,
        ),
      );

  ThemeData get darkTheme => ThemeData(
        primaryColor: ColorManager.primary,
        primaryColorLight: ColorManager.lightPrimary,
        primaryColorDark: ColorManager.darkPrimary,
        disabledColor: ColorManager.grey,
        // splashColor: ColorManager.lightPrimary,
        colorScheme: const ColorScheme.dark().copyWith(
          primary: ColorManager.primary,
          secondary: ColorManager.darkPrimary,
          surface: Colors.black,
        ),
        appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(color: Colors.white),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.r),
                  bottomRight: Radius.circular(25.r))),
          centerTitle: false,
          color: ColorManager.lightPrimary,
          elevation: AppSize.s3,
          shadowColor: ColorManager.lightPrimary,
          titleTextStyle: AppTextStyles.largeTitle20,
        ),
        fontFamily: GoogleFonts.cairo().fontFamily,
        iconTheme: const IconThemeData(color: Colors.white),
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.black,
        ),
        cardTheme: CardTheme(
          color: ColorManager.black,
          shadowColor: ColorManager.grey,
        ),
      );
}

// ThemeClass _themeClass = ThemeClass();

// ThemeData getApplicationTheme() {
//   return ThemeData(
//     //main color
//     primaryColor: ColorManager.primary,
//     primaryColorLight: ColorManager.lightPrimary,
//     primaryColorDark: ColorManager.darkPrimary,
//     disabledColor: ColorManager.grey,
//     splashColor: ColorManager.lightPrimary,
//
//     //cardView Theme
//     cardTheme: CardTheme(
//         color: ColorManager.offWhite,
//         shadowColor: ColorManager.grey,
//         elevation: AppSize.s4),
//
//     //appBar theme
//     appBarTheme: AppBarTheme(
//       centerTitle: true,
//       color: ColorManager.primary,
//       elevation: AppSize.s4,
//       shadowColor: ColorManager.lightPrimary,
//       titleTextStyle:
//           TextStyle(fontSize: FontSize.s16, color: ColorManager.white),
//     ),
//
//     //button theme
//     buttonTheme: ButtonThemeData(
//         shape: const StadiumBorder(),
//         disabledColor: ColorManager.grey,
//         buttonColor: ColorManager.primary,
//         splashColor: ColorManager.lightPrimary),
//
//     //elevatedButton theme
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//           textStyle: getRegularStyle14(
//               color: ColorManager.white, fontSize: FontSize.s17),
//           backgroundColor: ColorManager.primary,
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(AppSize.s12)),
//           shadowColor: ColorManager.lightPrimary),
//     ),
//
//     //text theme
//     textTheme: TextTheme(
//       displayLarge: getBoldStyle22(
//         color: ColorManager.darkGrey,
//       ),
//       headlineLarge: getSemiBoldStyle20(color: ColorManager.darkGrey),
//       titleMedium: getMediumStyle16(color: ColorManager.lightGrey),
//       bodyMedium: getRegularStyle14(color: ColorManager.grey),
//     ),
//
//     //input decoration theme(textFormField)
//     inputDecorationTheme: InputDecorationTheme(
//       contentPadding: const EdgeInsets.all(AppPadding.p8),
//       hintStyle: getRegularStyle14(color: ColorManager.grey),
//       labelStyle: getRegularStyle14(color: ColorManager.grey),
//       errorStyle: getRegularStyle14(color: ColorManager.error),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(AppSize.s10),
//         borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s2),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(AppSize.s10),
//         borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s2),
//       ),
//       errorBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(AppSize.s10),
//         borderSide: BorderSide(color: ColorManager.error, width: AppSize.s2),
//       ),
//       focusedErrorBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(AppSize.s10),
//         borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s2),
//       ),
//     ),
//   );
// }
