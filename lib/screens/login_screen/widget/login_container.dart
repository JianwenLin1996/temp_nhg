import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/widgets/widgets.dart';

class LoginContainer extends StatelessWidget {
  final String title;
  final String description;
  final Widget? child;
  const LoginContainer({
    Key? key,
    required this.title,
    required this.description,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child == null
        ? Container()
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: 21.w),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Styles.whiteColor,
                  borderRadius: BorderRadius.circular(20.r)),
              child: Padding(
                  padding: EdgeInsets.only(
                      top: 42.h, bottom: 31.h, left: 27.h, right: 27.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: CustomTextStyle.pageTitleStyle(),
                      ),
                      DefaultSizedBox.vertical(7.h),
                      Text(
                        description,
                        style: CustomTextStyle.pageDescriptionStyle(),
                      ),
                      DefaultSizedBox.vertical(36.h),
                      child ?? Container(),
                    ],
                  )),
            ),
          );
  }
}
