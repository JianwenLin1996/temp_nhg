import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/models/models.dart';
import 'package:nhg_layout/utils/utils.dart';
import 'package:nhg_layout/widgets/widgets.dart';

class NotificationRow extends StatelessWidget {
  final NotificationItem item;
  const NotificationRow({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            item.notificationIcon == null
                ? Image.asset(AppIcons.notificationIconUnavailable)
                : Stack(
                    children: [
                      Image.asset(
                        AppIcons.notificationIconBG,
                        width: 35.w,
                      ),
                      Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Image.asset(
                          AppImages.appLogo,
                          width: 35.w,
                        ),
                      )
                    ],
                  ),
            DefaultSizedBox.horizontal(14.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: item.notificationBy == null
                          ? ''
                          : (item.notificationBy! + ' '),
                      style: CustomTextStyle.notificationByStyle(),
                      children: <TextSpan>[
                        TextSpan(
                          text: item.notificationMessage,
                          style: CustomTextStyle.notificationMessageStyle(),
                        )
                      ],
                    ),
                  ),
                  DefaultSizedBox.vertical(5.h),
                  Text(
                    DateFormatUtils.dateTimeDifferenceFormatter(
                        item.notificationCreatedAt),
                    style: CustomTextStyle.notificationTimeStyle(),
                  )
                ],
              ),
            )
          ],
        ),
        DefaultSizedBox.vertical(25.h)
      ],
    );
  }
}
