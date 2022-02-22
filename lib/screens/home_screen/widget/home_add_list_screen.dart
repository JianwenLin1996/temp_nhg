import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nhg_layout/constants/app_strings.dart';
import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/constants/icon_image_path.dart';
import 'package:nhg_layout/models/models.dart';
import 'package:nhg_layout/routes/routes.dart';
import 'package:nhg_layout/screens/home_screen/widget/empty_list_display.dart';
import 'package:nhg_layout/widgets/widgets.dart';

class HomeAddListScreen extends StatefulWidget {
  const HomeAddListScreen({Key? key}) : super(key: key);

  @override
  State<HomeAddListScreen> createState() => _HomeAddListScreenState();
}

class _HomeAddListScreenState extends State<HomeAddListScreen>
    with AutomaticKeepAliveClientMixin<HomeAddListScreen> {
  List<Item> itemList = [
    Item(
        id: '0001A',
        status: ItemStatus(id: 0, label: 'Sent Out'),
        createdAt: DateTime.now().subtract(Duration(days: 3)),
        location: 'TLG SOLUTIONS',
        typeList: [
          ItemType(id: 0, name: 'Wooden Frame', amount: 100),
          ItemType(id: 1, name: 'Iron Frame', amount: 50)
        ]),
    Item(
        id: '0002B',
        status: ItemStatus(id: 0, label: 'Sent Out'),
        createdAt: DateTime.now().subtract(Duration(days: 16)),
        location: 'TLG SOLUTIONS',
        typeList: [ItemType(id: 1, name: 'Iron Frame', amount: 50)]),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
                child: Container(
                    // whole screen
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.0, 0.3],
                            colors: Styles.emptyBackgroundColor)),
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        DefaultSizedBox.vertical(104.h),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: itemList[0].status.id == 0
                                      ? Styles.statusSentOut
                                      : Styles.statusCollected,
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20.r))),
                              padding: EdgeInsets.only(left: 24.w, right: 13.w),
                              height: 28.h,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Item ID: ' + itemList[0].id,
                                    style: CustomTextStyle.itemIdStyle(),
                                  ),
                                  Text(
                                    itemList[0].status.label,
                                    style: CustomTextStyle.itemStatusStyle(),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Styles.whiteColor,
                                  borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(20.r))),
                              padding: EdgeInsets.only(
                                  top: 13.h,
                                  bottom: 13.h,
                                  left: 24.w,
                                  right: 13.w),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [],
                                    ),
                                  ),
                                  Container(
                                    width: 67.w,
                                    height: 67.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.r))),
                                    child: Image.asset(
                                      AppImages.item01,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                    // const EmptyListDisplay(),
                    ))
          ],
        ),
        DefaultAppBar(
          hasBackButton: false,
          titleText: AppStrings.myItem,
          actionIcons: [
            AppBarActionIcon(
              onTap: () {
                Navigator.pushNamed(context, RouteList.notificationScreen);
              },
              path: AppIcons.featherBell,
            ),
            const AppBarActionIcon(
              path: AppIcons.refresh,
            )
          ],
        )
      ],
    );
  }
}
