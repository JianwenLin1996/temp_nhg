import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/models/models.dart';
import 'package:nhg_layout/screens/home_screen/widget/widget.dart';
import 'package:nhg_layout/screens/notification_screen/widget/notification_row.dart';
import 'package:nhg_layout/screens/profile_screen/view.dart';
import 'package:nhg_layout/utils/datetime_difference_utils.dart';
import 'package:nhg_layout/widgets/widgets.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationItem> notificationList = [
    NotificationItem(
        notificationIcon: AppIcons.notificationIconBG,
        notificationMessage: 'welcome Bailey Tan.',
        notificationCreatedAt: DateTime.now(),
        notificationBy: 'Admin'),
    NotificationItem(
        notificationMessage:
            'Items have been sent out to TG SOLUTIONS by Bailey Tan.',
        notificationCreatedAt:
            DateTime.now().subtract(const Duration(minutes: 30)))
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Expanded(
                child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 0.3],
                      colors: Styles.emptyBackgroundColor)),
              child: Column(
                children: [
                  Container(
                      color: Styles.whiteColor,
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultSizedBox.vertical(88.h),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 21.h),
                            child: Text(
                              'Today',
                              style:
                                  CustomTextStyle.notificationCategoryStyle(),
                            ),
                          ),
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>
                                NotificationRow(item: notificationList[index]),
                            itemCount: notificationList.length,
                          )
                        ],
                      )),
                ],
              ),
            ))
          ],
        ),
        const DefaultAppBar(
          hasBackButton: true,
          titleText: 'Notification',
          actionIcons: [],
        )
      ],
    ));
  }
}
