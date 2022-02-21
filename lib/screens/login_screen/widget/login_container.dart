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
            padding: EdgeInsets.symmetric(horizontal: 48.w),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Styles.whiteColor,
                  borderRadius: BorderRadius.circular(30.r)),
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 32.w, vertical: 48.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: CustomTextStyle.appBarTitle(),
                      ),
                      DefaultSizedBox.vertical(10.h),
                      Text(
                        description,
                        style: CustomTextStyle.titleDescription(
                            color: Styles.lightGrey),
                      ),
                      DefaultSizedBox.vertical(50.h),
                      child ?? Container(),
                    ],
                  )),
            ),
          );
  }
}
