import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/widgets/widgets.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String title;

  const InputField({
    Key? key,
    required this.controller,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: CustomTextStyle.textRegular(fontSize: 13.sp),
        ),
        DefaultSizedBox.vertical(10.h),
        DefaultTextFormField(
          controller: controller,
          isLogin: false,
        ),
        DefaultSizedBox.vertical(23.h),
      ],
    );
  }
}
