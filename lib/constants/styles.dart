import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Styles {
  static double fontSize10 = 13.sp;
  static double smallerRegularFontSize = 17.sp;
  static double regularFontSize = 21.sp;
  static double smallerTitleFontSize = 25.sp;
  static double titleFontSize = 29.sp;
  static double largerTitleFontSize = 33.sp;

  static const FontWeight lightText = FontWeight.w300;
  static const FontWeight regularText = FontWeight.normal;
  static const FontWeight mediumText = FontWeight.w500;
  static const FontWeight boldText = FontWeight.w700;
  static const FontWeight boldAppBarTitleText = FontWeight.w800;

  static const Color blackColor = Colors.black;
  static const Color whiteColor = Colors.white;
  static const Color greyColor = Colors.grey;
  static const Color loginInputGrey = Color(0xFFF6F7F9);
  static const Color loginInputBorderGrey = Color(0xFFD5D9DF);

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
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;

  const CustomTextStyle({
    required this.color,
    required this.fontWeight,
    required this.fontSize,
  });

  CustomTextStyle.titleDescription({
    this.color = Styles.blackColor,
  })  : fontWeight = Styles.regularText,
        fontSize = Styles.regularFontSize;

  CustomTextStyle.appBarTitle({
    this.color = Styles.blackColor,
  })  : fontWeight = Styles.boldText,
        fontSize = Styles.titleFontSize;

  CustomTextStyle.largerAppBarTitle({
    this.color = Styles.blackColor,
  })  : fontSize = Styles.largerTitleFontSize,
        fontWeight = Styles.boldAppBarTitleText;

  CustomTextStyle.categoryTitle({
    this.color = Styles.blackColor,
  })  : fontWeight = Styles.boldText,
        fontSize = Styles.regularFontSize;

  CustomTextStyle.hint({
    this.color = Styles.greyColor,
  })  : fontWeight = Styles.regularText,
        fontSize = Styles.regularFontSize;

  CustomTextStyle.error({
    this.color = Styles.errorColor,
  })  : fontWeight = Styles.boldText,
        fontSize = Styles.regularFontSize;
}
