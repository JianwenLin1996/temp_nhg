import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/providers/theme_provider.dart';

class LoginButton extends StatelessWidget {
  final Function()? onPressed;
  final String buttonText;
  final Color? bgColor;
  final Color? textColor;
  final Color? borderColor;

  const LoginButton({
    Key? key,
    this.onPressed,
    required this.buttonText,
    this.bgColor,
    this.textColor,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color appThemeColor =
        Provider.of<ThemeNotifier>(context).theme.primaryColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ElevatedButton(
              onPressed: onPressed ?? () {},
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      bgColor ?? appThemeColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    side: BorderSide(color: borderColor ?? appThemeColor),
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  ))),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Text(
                  buttonText,
                  style: CustomTextStyle.titleDescription(
                      color: textColor ?? Styles.whiteColor),
                ),
              )),
        ),
      ],
    );
  }
}
