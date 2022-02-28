import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nhg_layout/widgets/default_sized_box.dart';
import 'package:provider/provider.dart';

import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/providers/theme_provider.dart';

class DefaultButton extends StatelessWidget {
  final Function()? onPressed;
  final String buttonText;
  final TextStyle? textStyle;
  final Color? bgColor;
  final Color? textColor;
  final Color? borderColor;
  final double? borderRadius;
  final double? verticalPadding;

  const DefaultButton(
      {Key? key,
      this.onPressed,
      required this.buttonText,
      this.textStyle,
      this.bgColor,
      this.textColor,
      this.borderColor,
      this.borderRadius,
      this.verticalPadding})
      : super(key: key);

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
                    borderRadius:
                        BorderRadius.all(Radius.circular(borderRadius ?? 12.r)),
                  ))),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: verticalPadding ?? 12.h),
                child: Text(
                  buttonText,
                  style: textStyle == null
                      ? CustomTextStyle.displayRegular(
                          fontSize: 16.sp,
                          color: textColor ?? Styles.whiteColor)
                      : null,
                ),
              )),
        ),
      ],
    );
  }
}

class UploadPhotoButton extends StatelessWidget {
  final Function()? onPressed;
  final double width;
  const UploadPhotoButton({
    Key? key,
    this.onPressed,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color appThemeColor =
        Provider.of<ThemeNotifier>(context).theme.primaryColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: width,
          child: ElevatedButton(
              onPressed: onPressed ?? () {},
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(appThemeColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    side: const BorderSide(color: Styles.uploadImageBorderDark),
                    borderRadius: BorderRadius.all(Radius.circular(30.r)),
                  ))),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppIcons.camera,
                      width: 17.w,
                    ),
                    DefaultSizedBox.horizontal(10.w),
                    Text(
                      AppStrings.uploadPhoto,
                      style: CustomTextStyle.displayMedium(
                          fontSize: 14.sp, color: Styles.whiteColor),
                    ),
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
