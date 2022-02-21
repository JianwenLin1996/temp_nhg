import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Styles {
  // Splash screen
  static double fontSize10 = 13.sp;
  static double smallerRegularFontSize = 17.sp;
  static double regularFontSize = 21.sp;
  static double smallerTitleFontSize = 25.sp;
  static double titleFontSize = 29.sp;
  static double largerTitleFontSize = 33.sp;

  static const FontWeight thin = FontWeight.w100;
  static const FontWeight lightText = FontWeight.w300;
  static const FontWeight regularText = FontWeight.normal;
  static const FontWeight mediumText = FontWeight.w500;
  static const FontWeight semiBoldText = FontWeight.w600;
  static const FontWeight boldText = FontWeight.w700;

  static const Color blackColor = Colors.black;
  static const Color whiteColor = Colors.white;
  static const Color loginInputGrey = Color(0xFFF6F7F9);
  static const Color loginInputBorderGrey = Color(0xFFD5D9DF);

  // Login & ForgotPassword Screen
  static const Color lightGrey = Color(0xFFAFAFAF);

  static const Color errorColor = Colors.red;

  static const List<Color> emptyBackgroundColor = [
    Styles.whiteColor,
    Color(0xFFF7F7FA)
  ];

  //No need primary color since its in provider already
  // static const primaryColor1 = Color(0xFF665EFF);
  // static const primaryColor1Light = Color(0xFF9B4BF9);

}

class CustomTextStyle extends TextStyle {
  @override
  final Color color;
  @override
  final FontWeight fontWeight;
  @override
  final double fontSize;
  @override
  final String fontFamily;

  const CustomTextStyle({
    required this.color,
    required this.fontWeight,
    required this.fontSize,
    required this.fontFamily,
  });

  CustomTextStyle.copyRightStyle({this.color = Styles.lightGrey})
      : fontFamily = 'SFProText',
        fontWeight = FontWeight.w300,
        fontSize = 11.sp;

  // Login & ForgotPassword screens
  CustomTextStyle.pageTitleStyle({this.color = const Color(0xFF002251)})
      : fontFamily = 'SFProDisplay',
        fontWeight = Styles.boldText,
        fontSize = 23.sp;

  CustomTextStyle.pageDescriptionStyle({this.color = const Color(0xFFAAB2BE)})
      : fontFamily = 'SFProDisplay',
        fontWeight = Styles.regularText,
        fontSize = 14.sp;

  CustomTextStyle.loginInputTitleStyle({this.color = const Color(0xFF002251)})
      : fontFamily = 'SFProDisplay',
        fontWeight = Styles.mediumText,
        fontSize = 14.sp;

  CustomTextStyle.loginInputStyle({this.color = const Color(0xFFC9CED6)})
      : fontFamily = 'SFProDisplay',
        fontWeight = Styles.regularText,
        fontSize = 16.sp;

  //

  CustomTextStyle.titleDescription(
      {this.color = Styles.blackColor, this.fontFamily = 'SFProText'})
      : fontWeight = Styles.regularText,
        fontSize = Styles.regularFontSize;

  CustomTextStyle.appBarTitle(
      {this.color = Styles.blackColor, this.fontFamily = 'SFProText'})
      : fontWeight = Styles.boldText,
        fontSize = Styles.titleFontSize;

  CustomTextStyle.largerAppBarTitle(
      {this.color = Styles.blackColor, this.fontFamily = 'SFProText'})
      : fontSize = Styles.largerTitleFontSize,
        fontWeight = Styles.semiBoldText;

  CustomTextStyle.categoryTitle(
      {this.color = Styles.blackColor, this.fontFamily = 'SFProText'})
      : fontWeight = Styles.boldText,
        fontSize = Styles.regularFontSize;

  CustomTextStyle.hint(
      {this.color = Styles.lightGrey, this.fontFamily = 'SFProText'})
      : fontWeight = Styles.regularText,
        fontSize = Styles.regularFontSize;

  CustomTextStyle.error(
      {this.color = Styles.errorColor, this.fontFamily = 'SFProText'})
      : fontWeight = Styles.boldText,
        fontSize = Styles.regularFontSize;
}
