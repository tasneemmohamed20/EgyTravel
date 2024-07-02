import 'package:egy_travel/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// where all TextStyles will be stored for less code and more readability

abstract class Styles {
  //Fonts
  static String kPrimaryFontStyle = GoogleFonts.montserrat().fontFamily!;

  //Thin Text

  static TextStyle textThin10 = TextStyle(
    fontFamily: kPrimaryFontStyle,
    fontSize: 10,
    color: ColorManager.kColorHit,
    fontWeight: FontWeight.w100,
  );

  //Regular text

  static TextStyle textRegular12 = TextStyle(
    fontFamily: kPrimaryFontStyle,
    fontSize: 12,
    color: Colors.white,
    fontWeight: FontWeight.w400,
  );

  static TextStyle textRegular14 = TextStyle(
    fontFamily: kPrimaryFontStyle,
    fontSize: 14,
    color: ColorManager.kColorSubTitle,
    fontWeight: FontWeight.w400,
  );

  static TextStyle textRegular16 = TextStyle(
    fontFamily: kPrimaryFontStyle,
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w400,
  );

  static TextStyle textRegular18 = TextStyle(
    fontFamily: kPrimaryFontStyle,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );
  static TextStyle textPrimaryRegular18 = TextStyle(
    fontFamily: kPrimaryFontStyle,
    color: ColorManager.kColorPrimary,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static TextStyle textRegular22 = TextStyle(
    fontFamily: kPrimaryFontStyle,
    fontSize: 22,
    color: Colors.white,
    fontWeight: FontWeight.w400,
  );

  // Bold text
  static TextStyle textBold12 = TextStyle(
    fontFamily: kPrimaryFontStyle,
    fontSize: 12,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );

  static TextStyle textBold14 = TextStyle(
    fontFamily: kPrimaryFontStyle,
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );

  static TextStyle textBold16 = TextStyle(
    fontFamily: kPrimaryFontStyle,
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );
  static TextStyle textPrimaryBold14 = TextStyle(
    fontFamily: kPrimaryFontStyle,
    fontSize: 14,
    color: ColorManager.kColorPrimary,
    fontWeight: FontWeight.w700,
  );
  static TextStyle textPrimaryBold16 = TextStyle(
    fontFamily: kPrimaryFontStyle,
    fontSize: 16,
    color: ColorManager.kColorPrimary,
    fontWeight: FontWeight.w700,
  );

  static TextStyle textBold18 = TextStyle(
    fontFamily: kPrimaryFontStyle,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  static TextStyle textBold20 = TextStyle(
    fontFamily: kPrimaryFontStyle,
    fontSize: 20,
    // color: Colors.white,
    fontWeight: FontWeight.w700,
  );
  static TextStyle textWhiteBold22 = TextStyle(
    fontFamily: kPrimaryFontStyle,
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );
  static TextStyle textPrimaryBold22 = TextStyle(
    fontFamily: kPrimaryFontStyle,
    color: ColorManager.kColorPrimary,
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );
}
