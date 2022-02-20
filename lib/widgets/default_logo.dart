import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/constants/styles.dart';

class DefaultLogo extends StatelessWidget {
  final double? width;

  const DefaultLogo({
    Key? key,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.appLogoTrans,
      width: width == null ? 0.7.sw : width,
    );
  }
}
