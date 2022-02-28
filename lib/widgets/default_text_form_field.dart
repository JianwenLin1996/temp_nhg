import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class DefaultTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final bool isLogin;
  final Color borderColor;
  final Color fillColor;
  final double? borderRadius;
  final int? line;
  const DefaultTextFormField(
      {Key? key,
      required this.controller,
      this.hintText,
      this.hintTextStyle,
      this.isLogin = true,
      this.borderColor = const Color(0xFFC9CED6),
      this.fillColor = Styles.whiteColor,
      this.borderRadius,
      this.line = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: false,
      minLines: line,
      maxLines: line,
      enabled: true,
      textInputAction: TextInputAction.done,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.text,
      inputFormatters: const [],
      textAlign: TextAlign.left,
      textAlignVertical: TextAlignVertical.center,
      style: CustomTextStyle.displayRegular(
          fontSize: 16.sp, color: Styles.blackColor),
      onChanged: (val) {},
      onFieldSubmitted: (val) {},
      validator: (val) => null,
      decoration: InputDecoration(
        filled: true,
        fillColor: isLogin ? Styles.loginInput : fillColor,
        hintText: hintText ?? '',
        helperText: null,
        errorStyle: TextStyle(fontSize: 17.sp),
        hintStyle:
            hintTextStyle ?? CustomTextStyle.displayRegular(fontSize: 16.sp),
        enabledBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(borderRadius ?? 12.r)),
            borderSide: BorderSide(
              width: 1.w,
              color: isLogin ? Styles.loginInput : borderColor,
            )),
        border: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(borderRadius ?? 12.r)),
            borderSide: BorderSide(
              width: 1.w,
              color: isLogin ? Styles.loginInput : borderColor,
            )),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          width: 1.w,
          color: Styles.lightGrey,
        )),
        focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(borderRadius ?? 12.r)),
            borderSide: BorderSide(
              width: 2.w,
              color: Provider.of<ThemeNotifier>(context).theme.primaryColor,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
          width: 1.w,
          color: Styles.delete,
        )),
        prefixIcon: null,
        prefixIconConstraints: BoxConstraints(
          minWidth: 2.w,
          minHeight: 2.h,
        ),
        suffixIconConstraints: BoxConstraints(
          minWidth: 2.w,
          minHeight: 2.h,
        ),
        suffixIcon: null,
        contentPadding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 13.h),
        isDense: false,
      ),
    );
  }
}
