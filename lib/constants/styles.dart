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
  @override
  final Color color;
  @override
  final FontWeight fontWeight;
  @override
  final double fontSize;
  @override
  final String fontFamily;
  @override
  TextDecoration? decoration;

  CustomTextStyle({
    required this.color,
    required this.fontWeight,
    required this.fontSize,
    required this.fontFamily,
    this.decoration,
  });

  CustomTextStyle.copyRightStyle({this.color = Styles.lightGrey})
      : fontFamily = 'SFProText',
        fontWeight = Styles.lightText,
        fontSize = 11.sp;

  // Login & ForgotPassword screens
  CustomTextStyle.pageTitleStyle({this.color = const Color(0xFF002251)})
      : fontFamily = 'SFProDisplay',
        fontWeight = Styles.boldText,
        fontSize = 22.sp;

  CustomTextStyle.pageDescriptionStyle({this.color = const Color(0xFFAAB2BE)})
      : fontFamily = 'SFProDisplay',
        fontWeight = Styles.regularText,
        fontSize = 14.sp;

  CustomTextStyle.loginInputTitleStyle(
      {this.color = const Color(0xFF002251), this.decoration = null})
      : fontFamily = 'SFProDisplay',
        fontWeight = Styles.mediumText,
        fontSize = 14.sp;

  CustomTextStyle.generalInputStyle(
      {this.color = const Color(0xFFC9CED6)}) // color for login hint text
      : fontFamily = 'SFProDisplay',
        fontWeight = Styles.regularText,
        fontSize = 16.sp; // add new item dropdown //

  // Home screen

  CustomTextStyle.largerAppBarTitle({this.color = const Color(0xFF454F63)})
      : fontFamily = 'SFProDisplay',
        fontSize = 24.sp,
        fontWeight = Styles.boldText;

  CustomTextStyle.mediumAppBarTitle({this.color = const Color(0xFF454F63)})
      : fontFamily = 'SFProDisplay',
        fontSize = 20.sp,
        fontWeight = Styles.mediumText;

  // Profile screen

  // Notification screen

  CustomTextStyle.notificationCategoryStyle(
      {this.color = Styles.notificationCategoryDark})
      : fontFamily = 'SFProText',
        fontWeight = Styles.regularText,
        fontSize = 16.sp;

  CustomTextStyle.notificationByStyle(
      {this.color = Styles.notificationCategoryDark})
      : fontFamily = 'SFProText',
        fontWeight = Styles.mediumText,
        fontSize = 13.sp; // add new item sub category // del

  CustomTextStyle.notificationMessageStyle(
      {this.color = Styles.notificationCategoryDark})
      : fontFamily = 'SFProText',
        fontWeight = Styles.lightText,
        fontSize = 13.sp;

  CustomTextStyle.notificationTimeStyle(
      {this.color = Styles.notificationCategoryDark})
      : fontFamily = 'SFProText',
        fontWeight = Styles.regularText,
        fontSize = 8.sp;

  // Item screen
  CustomTextStyle.itemIdStyle({this.color = Styles.whiteColor})
      : fontFamily = 'SFProDisplay',
        fontWeight = Styles.regularText,
        fontSize = 13.sp;

  CustomTextStyle.itemDescriptionStyle({this.color = Styles.profileInfoDark})
      : fontFamily = 'SFProDisplay',
        fontWeight = Styles.mediumText,
        fontSize = 14.sp; // upload photo

  CustomTextStyle.itemStatusStyle({this.color = Styles.whiteColor})
      : fontFamily = 'SFProDisplay',
        fontWeight = Styles.semiBoldText,
        fontSize = 15.sp; // add new item category

  // Add New Item screen

  CustomTextStyle.addNewStyle(
      {this.color = Styles.whiteColor, this.decoration = null})
      : fontFamily = 'SFProText',
        fontWeight = Styles.semiBoldText,
        fontSize = 15.sp; // add new item

  CustomTextStyle.noDestinationStyle({this.color = Styles.blackColor})
      : fontFamily = 'SFProText',
        fontWeight = Styles.regularText,
        fontSize = 13.sp; // dialog category // location category

// Item Detail screen
  CustomTextStyle.detailStatusStyle({this.color = Styles.collected})
      : fontFamily = 'SFProDisplay',
        fontWeight = Styles.mediumText,
        fontSize = 16.sp; // upload photo

  CustomTextStyle.error(
      {this.color = Styles.delete, this.fontFamily = 'SFProText'})
      : fontWeight = Styles.boldText,
        fontSize = Styles.regularFontSize;
}
