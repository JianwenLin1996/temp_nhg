import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultSizedBox extends StatelessWidget {
  final ScreenUtil su = ScreenUtil();
  final double verticalSpacing;
  final double horizontalSpacing;
  final bool? isVertical;
  final bool isAlign;
  final Widget? child;

  DefaultSizedBox(
      {Key? key,
      this.verticalSpacing = 0,
      this.horizontalSpacing = 0,
      this.child,
      this.isAlign = false})
      : isVertical = null,
        super(key: key);

  DefaultSizedBox.vertical(double spacing, {Key? key})
      : isVertical = true,
        verticalSpacing = spacing,
        horizontalSpacing = 0,
        child = null,
        isAlign = false,
        super(key: key);

  DefaultSizedBox.horizontal(double spacing, {Key? key})
      : isVertical = false,
        verticalSpacing = 0,
        horizontalSpacing = spacing,
        child = null,
        isAlign = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isVertical == null || isVertical == true ? verticalSpacing.h : 0,
      width: isVertical == null || isVertical == false
          ? isAlign
              ? horizontalSpacing.h
              : horizontalSpacing.w
          : 0,
      child: child ?? Container(),
    );
  }
}
