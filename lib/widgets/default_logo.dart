import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nhg_layout/constants/constants.dart';

class DefaultLogo extends StatelessWidget {
  final double? width;
  final double? height;

  const DefaultLogo({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.appLogo,
      width: width ?? 191.w,
      height: height ?? 81.h,
    );
  }
}
