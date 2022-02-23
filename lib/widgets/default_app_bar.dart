import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nhg_layout/constants/constants.dart';

// class DefaultAppBar extends AppBar {
//   final String titleText;
//   final bool hasBackButton;
//   final Icon? backIcon;
//   final List<Widget>? actionIcons;
//   DefaultAppBar({
//     Key? key,
//     required this.titleText,
//     this.hasBackButton = false,
//     this.backIcon,
//     this.actionIcons,
//   }) : super(
//           key: key,
//           title: Text(titleText,
//               style: hasBackButton
//                   ? CustomTextStyle.appBarTitle()
//                   : CustomTextStyle.largerAppBarTitle()),
//           actions: actionIcons,
//           backgroundColor: Styles.whiteColor,
//           shadowColor: Styles.appBarShadowGrey,
//           elevation: 1,
//           automaticallyImplyLeading: hasBackButton,
//           leading: backIcon,
//         );
// }

class DefaultAppBar extends StatelessWidget {
  final String titleText;
  final bool hasBackButton;
  final List<AppBarActionIcon> actionIcons;
  final Widget? actionWidget;
  final String? backIcon;
  const DefaultAppBar({
    Key? key,
    required this.titleText,
    required this.hasBackButton,
    required this.actionIcons,
    this.actionWidget,
    this.backIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88.h,
      decoration: const BoxDecoration(color: Styles.whiteColor, boxShadow: [
        BoxShadow(color: Styles.appBarShadowGrey, blurRadius: 10)
      ]),
      child: Padding(
        padding: EdgeInsets.only(
            left: 30.w,
            right: hasBackButton ? 30.w : 0,
            bottom: hasBackButton ? 13.h : 7.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: hasBackButton
              ? [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        backIcon ?? AppIcons.back,
                        width: 24.w,
                      )),
                  Text(
                    titleText,
                    style: CustomTextStyle.mediumAppBarTitle(),
                  ),
                  Row(
                    children: actionIcons.isEmpty && actionWidget == null
                        ? [
                            const Icon(
                              Icons.arrow_back,
                              color: Colors.transparent,
                            )
                          ]
                        : actionWidget == null
                            ? actionIcons
                            : [actionWidget!],
                  )
                ]
              : [
                  Text(
                    titleText,
                    style: CustomTextStyle.largerAppBarTitle(),
                  ),
                  Row(
                    children: actionIcons,
                  )
                  // const [
                  //   AppBarActionIcon(
                  //     path: AppIcons.featherBell,
                  //   ),
                  //   AppBarActionIcon(
                  //     path: AppIcons.refreah,
                  //   )
                  // ])
                ],
        ),
      ),
    );
  }
}

class AppBarActionIcon extends StatelessWidget {
  final String path;
  final Function()? onTap;
  const AppBarActionIcon({
    Key? key,
    required this.path,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Padding(
        padding: EdgeInsets.only(right: 17.w),
        child: Image.asset(
          path,
          color: Styles.lightGrey,
          width: 22.w,
        ),
      ),
    );
  }
}
