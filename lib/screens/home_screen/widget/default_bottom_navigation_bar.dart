import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/providers/providers.dart';
import 'package:nhg_layout/screens/home_screen/widget/widget.dart';

class DefaultBottomNavigationBar extends StatelessWidget {
  final Function(int)? onTap;
  const DefaultBottomNavigationBar({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color appThemeColor =
        Provider.of<ThemeNotifier>(context).theme.primaryColor;
    return BottomNavigationBar(
        onTap: onTap ?? (value) {},
        currentIndex: 0,
        selectedItemColor: Styles.blackColor,
        unselectedItemColor: Styles.greyColor,
        items: [
          BottomNavigationItem(
              iconData: Icons.checklist_rounded,
              text: 'Item List',
              context: context),
          BottomNavigationItem(
              toNewPage: true,
              iconData: Icons.add_circle_outline_rounded,
              text: 'Add New Item',
              context: context),
          BottomNavigationItem(
              iconData: Icons.person, text: 'Profile', context: context),
        ]);
  }
}
