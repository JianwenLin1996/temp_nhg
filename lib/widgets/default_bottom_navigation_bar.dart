import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nhg_layout/constants/app_strings.dart';
import 'package:provider/provider.dart';

import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/providers/providers.dart';

class DefaultBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onTap;
  const DefaultBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: onTap ?? (value) {},
        // currentIndex: 0,
        selectedItemColor: Styles.blackColor,
        unselectedItemColor: const Color(0xFFCCD5DD),
        backgroundColor: Styles.whiteColor,
        items: [
          BottomNavigationItem(
              selectedIconPath: AppIcons.selectedTaskList,
              unselectedIconPath: AppIcons.unselectedTaskList,
              selected: currentIndex == 0,
              text: AppStrings.itemList,
              context: context),
          BottomNavigationItem(
              toNewPage: true,
              selectedIconPath: AppIcons.addNew,
              unselectedIconPath: AppIcons.addNew,
              selected: true,
              text: AppStrings.addNewItem,
              context: context),
          BottomNavigationItem(
              selectedIconPath: AppIcons.selectedProfile,
              unselectedIconPath: AppIcons.unselectedProfile,
              selected: currentIndex == 2,
              text: AppStrings.profile,
              context: context),
        ]);
  }
}

class BottomNavigationItem extends BottomNavigationBarItem {
  final String selectedIconPath;
  final String unselectedIconPath;
  final String text;
  final bool toNewPage;
  final bool selected;
  final BuildContext context;
  BottomNavigationItem({
    required this.selectedIconPath,
    required this.unselectedIconPath,
    required this.text,
    this.toNewPage = false,
    required this.selected,
    required this.context,
  }) : super(
            icon: Padding(
              padding: EdgeInsets.only(top: 12.h, bottom: 2.h),
              child: Image.asset(
                selected ? selectedIconPath : unselectedIconPath,
                width: 24.w,
                height: 24.w,
              ),
            ),
            title: Text(
              text,
              style: TextStyle(
                  color: toNewPage
                      ? Provider.of<ThemeNotifier>(context).theme.primaryColor
                      : selected
                          ? Styles.blackColor
                          : const Color(0xFFCCD5DD),
                  fontFamily: 'SFProText',
                  fontSize: 10.sp,
                  fontWeight: Styles.semiBoldText),
            ));
}
