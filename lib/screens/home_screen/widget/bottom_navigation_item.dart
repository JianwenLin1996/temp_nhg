import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/providers/providers.dart';

class BottomNavigationItem extends BottomNavigationBarItem {
  final IconData iconData;
  final String text;
  final bool toNewPage;
  final BuildContext context;
  BottomNavigationItem({
    required this.iconData,
    required this.text,
    this.toNewPage = false,
    required this.context,
  }) : super(
            icon: Icon(
              // Icons.add_circle_outline_rounded,
              iconData,
              color: toNewPage
                  ? Provider.of<ThemeNotifier>(context).theme.primaryColor
                  : null,
              size: 30,
            ),
            title: Text(
              // 'Add New Item',
              text,
              style: TextStyle(
                  color: toNewPage
                      ? Provider.of<ThemeNotifier>(context).theme.primaryColor
                      : null,
                  fontSize: Styles.smallerRegularFontSize,
                  fontWeight: Styles.boldText),
            ));
}
