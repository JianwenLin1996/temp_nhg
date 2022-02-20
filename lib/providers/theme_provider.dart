import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nhg_layout/utils/utils.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _theme = MyThemes.getThemeFromKey(MyThemeKeys.WORKER);
  ThemeData get theme => _theme;

  changeTheme(MyThemeKeys themeKey) {
    _theme = MyThemes.getThemeFromKey(themeKey);
    notifyListeners();
  }
}
