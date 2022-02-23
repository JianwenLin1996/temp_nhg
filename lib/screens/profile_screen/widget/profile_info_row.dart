import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/providers/providers.dart';
import 'package:nhg_layout/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ProfileInfoRow extends StatelessWidget {
  final String iconPath;
  final String infoTitle;
  final String info;
  final bool clickable;
  final bool status;
  final Function()? onTap;
  const ProfileInfoRow({
    Key? key,
    required this.iconPath,
    required this.infoTitle,
    required this.info,
    this.clickable = false,
    this.status = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color appThemeColor =
        Provider.of<ThemeNotifier>(context).theme.primaryColor;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  iconPath,
                  width: 12.w,
                  height: 16.h,
                ),
                DefaultSizedBox.horizontal(12.w),
                Text(
                  infoTitle + ' :',
                  style: CustomTextStyle.generalInputStyle(
                      customColor: Styles.profileInfoGrey1),
                ),
              ],
            ),
            (!clickable && !status)
                ? Text(
                    info,
                    style: CustomTextStyle.loginInputTitleStyle(
                        customColor: Styles.profileInfoDark),
                  )
                : clickable
                    ? InkWell(
                        onTap: onTap ?? () {},
                        child: Text(AppStrings.changePassword,
                            style: CustomTextStyle.loginInputTitleStyle(
                              customColor: appThemeColor,
                              customDecoration: TextDecoration.underline,
                            )),
                      )
                    : Row(children: [
                        Image.asset(
                          AppIcons.verified,
                          width: 13.w,
                        ),
                        DefaultSizedBox.horizontal(4.w),
                        Text(
                          'Verified',
                          style: CustomTextStyle.loginInputTitleStyle(
                              customColor: Styles.profileVerified),
                        )
                      ])
          ],
        ),
        DefaultSizedBox.vertical(16.h)
      ],
    );
  }
}
