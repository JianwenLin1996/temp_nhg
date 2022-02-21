import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nhg_layout/constants/constants.dart';

class DefaultAppBar extends AppBar {
  final String titleText;
  final bool hasBackButton;
  final Icon? backIcon;
  final List<Widget>? actionIcons;
  DefaultAppBar({
    Key? key,
    required this.titleText,
    this.hasBackButton = false,
    this.backIcon,
    this.actionIcons,
  }) : super(
          key: key,
          title: Text(titleText,
              style: hasBackButton
                  ? CustomTextStyle.appBarTitle()
                  : CustomTextStyle.largerAppBarTitle()),
          actions: actionIcons,
          backgroundColor: Styles.whiteColor,
          shadowColor: Colors.grey.withOpacity(0.2),
          elevation: 1,
          automaticallyImplyLeading: hasBackButton,
          leading: backIcon,
        );
}

class AppBarActionIcon extends StatelessWidget {
  final IconData icon;
  final Function()? onTap;
  const AppBarActionIcon({
    Key? key,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Icon(
          icon,
          color: Styles.lightGrey,
          size: 40.sp,
        ),
      ),
    );
  }
}
