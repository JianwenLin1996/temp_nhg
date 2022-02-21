import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/widgets/widgets.dart';

class LoginInputField extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final String hintText;
  const LoginInputField({
    Key? key,
    required this.title,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  _LoginInputFieldState createState() => _LoginInputFieldState();
}

class _LoginInputFieldState extends State<LoginInputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: CustomTextStyle.loginInputTitleStyle(),
        ),
        DefaultSizedBox.vertical(16.h),
        DefaultTextFormField(
            controller: widget.controller, hintText: widget.hintText),
      ],
    );
  }
}
