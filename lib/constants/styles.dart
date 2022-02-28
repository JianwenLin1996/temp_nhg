import 'package:flutter/material.dart';

class Styles {
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight lightText = FontWeight.w300;
  static const FontWeight regularText = FontWeight.normal;
  static const FontWeight mediumText = FontWeight.w500;
  static const FontWeight semiBoldText = FontWeight.w600;
  static const FontWeight boldText = FontWeight.w700;

  static const Color blackColor = Colors.black;
  static const Color whiteColor = Colors.white;

  // Login & ForgotPassword screen
  static const Color lightGrey = Color(0xFFAFAFAF);
  static const Color appBarShadowGrey = Color(0xFF9F9F9F);
  static const Color loginInput = Color(0xFFF6F7F9);

  // Profile screen
  static const Color profileInfoDark = Color(0xFF002251);
  static const Color profileInfoGrey1 = Color(0xFF9195B2);
  static const Color profileInfoGrey2 = Color(0xFFAAB2BE);
  static const Color profileVerified = Color(0xFF089E1C);
  static const Color profileClickable = Color(0xFF665EFF); // Theme color
  static const Color profileLogout = Color(0xFF919191);

  // Notification screen
  static const Color notificationCategoryDark = Color(0xFF151522);

  // Item status
  static const Color statusSentOut = Color(0xFFF3AE36);
  static const Color statusCollected = Color(0xFFCBCBCB);
  static const Color itemCategory = Color(0xFF78849E);

  // Add New Item screen
  static const Color uploadImageBorderDark = Color(0xFF140E7D);
  static const Color delete = Color(0xFFD90202);

  // Item Detail screen
  static const Color collected = Color(0xFF63B90C);

  static const List<Color> emptyBackgroundColor = [
    Styles.whiteColor,
    Color(0xFFF7F7FA)
  ];
}

class CustomTextStyle extends TextStyle {
  // final Color customColor;
  // final FontWeight customFontWeight;
  // final double customFontSize;
  // final String customFontFamily;
  // final TextDecoration? customDecoration;

  const CustomTextStyle({
    color,
    fontWeight,
    fontSize,
    fontFamily,
    decoration,
  }) : super(
            color: color,
            fontWeight: fontWeight,
            fontSize: fontSize,
            fontFamily: fontFamily,
            decoration: decoration);

  ///// SF Pro Text /////

  const CustomTextStyle.textLight(
      {required fontSize, color = Styles.lightGrey, decoration})
      : super(
            color: color,
            fontWeight: Styles.lightText,
            fontSize: fontSize,
            fontFamily: 'SFProText',
            decoration:
                decoration); // if fontSize is set according to screensize using screenutils, it is not constant
  // also considering that in many occasions, fontsize of one sp difference might be required, so make it a required parameter looks reasonable

  const CustomTextStyle.textRegular(
      {required fontSize, color = Styles.notificationCategoryDark, decoration})
      : super(
            color: color,
            fontWeight: Styles.regularText,
            fontSize: fontSize,
            fontFamily: 'SFProText',
            decoration: decoration);

  const CustomTextStyle.textMedium(
      {required fontSize, color = Styles.notificationCategoryDark, decoration})
      : super(
            color: color,
            fontWeight: Styles.mediumText,
            fontSize: fontSize,
            fontFamily: 'SFProText',
            decoration: decoration);

  const CustomTextStyle.textSemiBold(
      {required fontSize, color = Styles.whiteColor, decoration})
      : super(
            color: color,
            fontWeight: Styles.semiBoldText,
            fontSize: fontSize,
            fontFamily: 'SFProText',
            decoration: decoration);

  const CustomTextStyle.textBold(
      {required fontSize, color = Styles.delete, decoration})
      : super(
            color: color,
            fontWeight: Styles.boldText,
            fontSize: fontSize,
            fontFamily: 'SFProText',
            decoration: decoration);

  ///// SF Pro Display /////

  const CustomTextStyle.displayRegular(
      {required fontSize, color = const Color(0xFFAAB2BE), decoration})
      : super(
            color: color,
            fontWeight: Styles.regularText,
            fontSize: fontSize,
            fontFamily: 'SFProDisplay',
            decoration: decoration);

  const CustomTextStyle.displayMedium(
      {required fontSize, color = const Color(0xFF002251), decoration})
      : super(
            color: color,
            fontWeight: Styles.mediumText,
            fontSize: fontSize,
            fontFamily: 'SFProDisplay',
            decoration: decoration);

  const CustomTextStyle.displaySemiBold(
      {required fontSize, color = Styles.blackColor, decoration})
      : super(
            color: color,
            fontWeight: Styles.semiBoldText,
            fontSize: fontSize,
            fontFamily: 'SFProDisplay',
            decoration: decoration);

  const CustomTextStyle.displayBold(
      {required fontSize, color = const Color(0xFF002251), decoration})
      : super(
            color: color,
            fontWeight: Styles.boldText,
            fontSize: fontSize,
            fontFamily: 'SFProDisplay',
            decoration: decoration);
}
