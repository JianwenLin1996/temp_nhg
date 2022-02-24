import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/widgets/widgets.dart';

class LoginImageBGContainer extends StatelessWidget {
  final Widget? child;
  const LoginImageBGContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(AppImages.appLoginBackground))),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DefaultSizedBox.vertical(72.h),
                const DefaultLogo(),
                DefaultSizedBox.vertical(14.h),
                Text(
                  AppStrings.welcome,
                  style: TextStyle(
                      color: Styles.whiteColor,
                      fontFamily: 'SFProDisplay',
                      fontSize: 35.sp,
                      fontWeight: Styles.boldText),
                ),
                Text(
                  AppStrings.appSlogan,
                  style: TextStyle(
                    color: Styles.whiteColor,
                    fontFamily: 'SFProDisplay',
                    fontSize: 15.sp,
                  ),
                ),
                DefaultSizedBox.vertical(40.h),
                child ?? Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
