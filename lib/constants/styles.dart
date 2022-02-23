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
  final Color customColor;
  final FontWeight customFontWeight;
  final double customFontSize;
  final String customFontFamily;
  final TextDecoration? customDecoration;

  const CustomTextStyle({
    required this.customColor,
    required this.customFontWeight,
    required this.customFontSize,
    required this.customFontFamily,
    required this.customDecoration,
  }) : super(
            color: customColor,
            fontWeight: customFontWeight,
            fontSize: customFontSize,
            fontFamily: customFontFamily,
            decoration: customDecoration);

  CustomTextStyle.copyRightStyle({
    this.customColor = Styles.lightGrey,
  })  : customFontFamily = 'SFProText',
        customFontWeight = Styles.lightText,
        customFontSize = 11.sp,
        customDecoration = null;

  // Login & ForgotPassword screens
  CustomTextStyle.pageTitleStyle({this.customColor = const Color(0xFF002251)})
      : customFontFamily = 'SFProDisplay',
        customFontWeight = Styles.boldText,
        customFontSize = 22.sp,
        customDecoration = null;

  CustomTextStyle.pageDescriptionStyle(
      {this.customColor = const Color(0xFFAAB2BE)})
      : customFontFamily = 'SFProDisplay',
        customFontWeight = Styles.regularText,
        customFontSize = 14.sp,
        customDecoration = null;

  CustomTextStyle.loginInputTitleStyle(
      {this.customColor = const Color(0xFF002251), this.customDecoration})
      : customFontFamily = 'SFProDisplay',
        customFontWeight = Styles.mediumText,
        customFontSize = 14.sp;

  CustomTextStyle.generalInputStyle(
      {this.customColor = const Color(0xFFC9CED6)}) // color for login hint text
      : customFontFamily = 'SFProDisplay',
        customFontWeight = Styles.regularText,
        customFontSize = 16.sp,
        customDecoration = null; // add new item dropdown //

  // Home screen

  CustomTextStyle.largerAppBarTitle(
      {this.customColor = const Color(0xFF454F63)})
      : customFontFamily = 'SFProDisplay',
        customFontSize = 24.sp,
        customFontWeight = Styles.boldText,
        customDecoration = null;

  CustomTextStyle.mediumAppBarTitle(
      {this.customColor = const Color(0xFF454F63)})
      : customFontFamily = 'SFProDisplay',
        customFontSize = 20.sp,
        customFontWeight = Styles.mediumText,
        customDecoration = null;

  // Profile screen

  // Notification screen

  CustomTextStyle.notificationCategoryStyle(
      {this.customColor = Styles.notificationCategoryDark})
      : customFontFamily = 'SFProText',
        customFontWeight = Styles.regularText,
        customFontSize = 16.sp,
        customDecoration = null;

  CustomTextStyle.notificationByStyle(
      {this.customColor = Styles.notificationCategoryDark})
      : customFontFamily = 'SFProText',
        customFontWeight = Styles.mediumText,
        customFontSize = 13.sp,
        customDecoration = null; // add new item sub category // del

  CustomTextStyle.notificationMessageStyle(
      {this.customColor = Styles.notificationCategoryDark})
      : customFontFamily = 'SFProText',
        customFontWeight = Styles.lightText,
        customFontSize = 13.sp,
        customDecoration = null;

  CustomTextStyle.notificationTimeStyle(
      {this.customColor = Styles.notificationCategoryDark})
      : customFontFamily = 'SFProText',
        customFontWeight = Styles.regularText,
        customFontSize = 8.sp,
        customDecoration = null;

  // Item screen
  CustomTextStyle.itemIdStyle({this.customColor = Styles.whiteColor})
      : customFontFamily = 'SFProDisplay',
        customFontWeight = Styles.regularText,
        customFontSize = 13.sp,
        customDecoration = null;

  CustomTextStyle.itemDescriptionStyle(
      {this.customColor = Styles.profileInfoDark})
      : customFontFamily = 'SFProDisplay',
        customFontWeight = Styles.mediumText,
        customFontSize = 14.sp,
        customDecoration = null; // upload photo

  CustomTextStyle.itemStatusStyle({this.customColor = Styles.whiteColor})
      : customFontFamily = 'SFProDisplay',
        customFontWeight = Styles.semiBoldText,
        customFontSize = 15.sp,
        customDecoration = null; // add new item category

  // Add New Item screen

  CustomTextStyle.addNewStyle(
      {this.customColor = Styles.whiteColor, this.customDecoration})
      : customFontFamily = 'SFProText',
        customFontWeight = Styles.semiBoldText,
        customFontSize = 15.sp; // add new item

  CustomTextStyle.noDestinationStyle({this.customColor = Styles.blackColor})
      : customFontFamily = 'SFProText',
        customFontWeight = Styles.regularText,
        customFontSize = 13.sp,
        customDecoration = null; // dialog category // location category

// Item Detail screen
  CustomTextStyle.detailStatusStyle({this.customColor = Styles.collected})
      : customFontFamily = 'SFProDisplay',
        customFontWeight = Styles.mediumText,
        customFontSize = 16.sp,
        customDecoration = null; // upload photo

  CustomTextStyle.greenButtonStyle({this.customColor = Styles.whiteColor})
      : customFontFamily = 'SFProText',
        customFontWeight = Styles.mediumText,
        customFontSize = 16.sp,
        customDecoration = null;

  CustomTextStyle.error(
      {this.customColor = Styles.delete, this.customFontFamily = 'SFProText'})
      : customFontWeight = Styles.boldText,
        customFontSize = Styles.regularFontSize,
        customDecoration = null;
}
