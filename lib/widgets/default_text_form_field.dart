import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class DefaultTextFormField extends StatelessWidget {
  TextEditingController controller;
  String? hintText;
  TextStyle? hintTextStyle;
  DefaultTextFormField({
    Key? key,
    required this.controller,
    this.hintText,
    this.hintTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: false,
      minLines: 1,
      maxLines: 1,
      enabled: true,
      textInputAction: TextInputAction.done,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.text,
      inputFormatters: [],
      textAlign: TextAlign.left,
      textAlignVertical: TextAlignVertical.center,
      style: TextStyle(
        color: Styles.blackColor,
        fontSize: Styles.regularFontSize,
      ),
      onChanged: (val) {},
      onFieldSubmitted: (val) {},
      validator: (val) => null,
      decoration: InputDecoration(
        filled: true,
        fillColor: Styles.loginInputGrey,
        hintText: hintText ?? '',
        helperText: null,
        errorStyle: TextStyle(
          fontSize: Styles.smallerRegularFontSize,
        ),
        hintStyle: hintTextStyle ??
            CustomTextStyle.hint(color: Styles.loginInputBorderGrey),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
            borderSide: BorderSide(
              width: 1.w,
              color: Styles.loginInputBorderGrey,
            )),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
            borderSide: BorderSide(
              width: 1.w,
              color: Styles.loginInputBorderGrey,
            )),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          width: 1.w,
          color: Styles.lightGrey,
        )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
            borderSide: BorderSide(
              width: 2.w,
              color: Provider.of<ThemeNotifier>(context).theme.primaryColor,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
          width: 1.w,
          color: Styles.errorColor,
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
        contentPadding: EdgeInsets.fromLTRB(
          20.w,
          5.h,
          20.w,
          5.h,
        ),
        isDense: false,
      ),
    );
  }
}
