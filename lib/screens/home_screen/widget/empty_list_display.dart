import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/constants/icon_image_path.dart';
import 'package:nhg_layout/providers/providers.dart';
import 'package:nhg_layout/widgets/widgets.dart';
import 'package:provider/provider.dart';

class EmptyListDisplay extends StatelessWidget {
  const EmptyListDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color appThemeColor =
        Provider.of<ThemeNotifier>(context).theme.primaryColor;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
            width: 68.w,
            child: Image.asset(
              AppImages.emptyBox,
              color: Styles.lightGrey,
            )),
        DefaultSizedBox.vertical(12.h),
        Text(
          AppStrings.noItem,
          style: CustomTextStyle.displayRegular(
              fontSize: 16.sp, color: const Color(0xFFCED3DA)),
        ),
        DefaultSizedBox.vertical(4.h),
        Text(
          AppStrings.startCreateItem,
          style: CustomTextStyle.displayRegular(
              fontSize: 16.sp, color: appThemeColor),
        ),
        DefaultSizedBox.vertical(4.h),
        const HomeScreenArrow(),
        DefaultSizedBox.vertical(80.h),
      ],
    );
  }
}

class HomeScreenArrow extends StatelessWidget {
  const HomeScreenArrow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color appThemeColor =
        Provider.of<ThemeNotifier>(context).theme.primaryColor;
    return Center(
      child: Column(
        children: [
          Text(
            '|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 29.sp,
                color: appThemeColor),
          ),
          Transform.translate(
            offset: Offset(0, -40.h),
            child: RotatedBox(
              quarterTurns: -1,
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: appThemeColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class EmptyListDisplay2 extends StatelessWidget {
  const EmptyListDisplay2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [Text('page 2')],
    );
  }
}

class EmptyListDisplay3 extends StatelessWidget {
  const EmptyListDisplay3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [Text('page 3')],
    );
  }
}
