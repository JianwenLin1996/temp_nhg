import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nhg_layout/constants/app_strings.dart';
import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/constants/icon_image_path.dart';
import 'package:nhg_layout/models/item/item_delivery_location.dart';
import 'package:nhg_layout/models/models.dart';
import 'package:nhg_layout/routes/routes.dart';
import 'package:nhg_layout/screens/home_screen/widget/empty_list_display.dart';
import 'package:nhg_layout/screens/home_screen/widget/item_card.dart';
import 'package:nhg_layout/utils/dateformat_utils.dart';
import 'package:nhg_layout/widgets/widgets.dart';

class HomeAddListScreen extends StatefulWidget {
  const HomeAddListScreen({Key? key}) : super(key: key);

  @override
  State<HomeAddListScreen> createState() => _HomeAddListScreenState();
}

class _HomeAddListScreenState extends State<HomeAddListScreen>
    with AutomaticKeepAliveClientMixin<HomeAddListScreen> {
  List<ItemDetail> itemList = [
    ItemDetail(
        id: '0001A',
        status: ItemStatus(id: 0, label: 'Sent Out'),
        createdAt: DateTime.now().subtract(Duration(days: 3)),
        personInCharge: 'Su Xiaolian',
        sentBy: 'Bailey Tan',
        contact: '012-3322512',
        location: ItemDeliveryLocation(
            name: 'TLG SOLUTIONS',
            address:
                'Jalan Subang 9, Taman Indah Subang Uep, 47630 Subang Jaya, Selangor'),
        imageList: [
          AppImages.item01
        ],
        typeList: [
          ItemType(id: 0, name: 'Wooden Frame', amount: 100),
          ItemType(id: 1, name: 'Iron Frame', amount: 50)
        ]),
    ItemDetail(
        id: '0002B',
        status: ItemStatus(id: 0, label: 'Sent Out'),
        createdAt: DateTime.now().subtract(Duration(days: 16)),
        personInCharge: 'Su Xiaolian',
        sentBy: 'Bailey Tan',
        contact: '012-3322512',
        location: ItemDeliveryLocation(
            name: 'TLG SOLUTIONS',
            address:
                'Jalan Subang 9, Taman Indah Subang Up, 47630 Subang Jaya, Selangor'),
        imageList: [
          AppImages.item02,
          AppImages.item01,
        ],
        typeList: [
          ItemType(id: 1, name: 'Iron Frame', amount: 50)
        ]),
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
                        ...itemList.map((val) => ItemCard(item: val))
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
            AppBarActionIcon(
              onTap: () {
                Navigator.pushNamed(context, RouteList.historyScreen);
              },
              path: AppIcons.refresh,
            )
          ],
        )
      ],
    );
  }
}
