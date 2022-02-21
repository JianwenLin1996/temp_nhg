import 'dart:io' show Platform;

import 'package:flutter/material.dart';

import '../constants/styles.dart';

enum MyThemeKeys { ADMIN, WORKER }

class MyThemes {
  // static const String appMainFontFamily = 'GothamBook';

  static final ThemeData basicTheme = ThemeData(
    // fontFamily: Platform.isIOS ? null : appMainFontFamily,
    brightness: Brightness.light,
  );

  static final ThemeData workerTheme = basicTheme.copyWith(
    primaryColor: const Color(0xFF665EFF),
    primaryColorLight: const Color(0xFF665EFF),
  );
  static ThemeData getThemeFromKey(MyThemeKeys themeKey) {
    switch (themeKey) {
      case MyThemeKeys.ADMIN:
        return workerTheme;
      case MyThemeKeys.WORKER:
        return workerTheme;

      default:
        return workerTheme;
    }
  }
}
