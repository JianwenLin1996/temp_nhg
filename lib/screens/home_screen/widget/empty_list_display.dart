import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nhg_layout/constants/constants.dart';
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
            width: 0.25.sw,
            child: Image.asset(
              AppIcons.emptyBox,
              color: Styles.greyColor,
            )),
        DefaultSizedBox.vertical(40.h),
        Text(
          'No any item yet.',
          style: CustomTextStyle.titleDescription(color: Styles.greyColor),
        ),
        DefaultSizedBox.vertical(10.h),
        Text(
          'Start to create your item.',
          style: CustomTextStyle.titleDescription(color: appThemeColor),
        ),
        DefaultSizedBox.vertical(40.h),
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
    return Column(
      children: [
        Text(
          '|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n',
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: Styles.titleFontSize,
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
    );
  }
}

class EmptyListDisplay2 extends StatelessWidget {
  const EmptyListDisplay2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color appThemeColor =
        Provider.of<ThemeNotifier>(context).theme.primaryColor;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [Text('page 2')],
    );
  }
}

class EmptyListDisplay3 extends StatelessWidget {
  const EmptyListDisplay3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color appThemeColor =
        Provider.of<ThemeNotifier>(context).theme.primaryColor;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [Text('page 3')],
    );
  }
}
