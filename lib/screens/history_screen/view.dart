import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/models/item/item_delivery_location.dart';
import 'package:nhg_layout/models/models.dart';
import 'package:nhg_layout/screens/home_screen/widget/item_card.dart';
import 'package:nhg_layout/screens/home_screen/widget/widget.dart';
import 'package:nhg_layout/screens/profile_screen/view.dart';
import 'package:nhg_layout/widgets/widgets.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<ItemDetail> itemList = [
    ItemDetail(
        id: '0001A',
        status: ItemStatus(id: 1, label: 'Collected'),
        createdAt: DateTime.now().subtract(Duration(days: 3)),
        personInCharge: 'Su Xiaolian',
        contact: '012-3322512',
        location: ItemDeliveryLocation(
            name: 'TLG SOLUTIONS',
            address:
                'Jalan Subang 9, Taman Indah Subang Uep, 47630 Subang Jaya, Selangor'),
        imageList: [AppImages.item01],
        typeList: [
          ItemType(id: 0, name: 'Wooden Frame', amount: 100),
          ItemType(id: 1, name: 'Iron Frame', amount: 50)
        ],
        collectedList: [
          ItemType(id: 0, name: 'Wooden Frame', amount: 66),
          ItemType(id: 1, name: 'Iron Frame', amount: 88)
        ],
        closedAt: DateTime.now().subtract(Duration(days: 1)),
        deliveryOrder:
            ItemDeliveryOrder(image: AppImages.sampleDO, number: 'AB12266'),
        sentBy: 'Bailey Tan',
        checkedBy: 'Bailey Tan',
        remark: 'Process is super duper smooth'),
    ItemDetail(
        id: '0002B',
        status: ItemStatus(id: 1, label: 'Collected'),
        createdAt: DateTime.now().subtract(Duration(days: 16)),
        personInCharge: 'Su Xiaolian',
        contact: '012-3322512',
        location: ItemDeliveryLocation(
            name: 'TLG SOLUTIONS',
            address:
                'Jalan Subang 9, Taman Indah Subang Uep, 47630 Subang Jaya, Selangor'),
        imageList: [AppImages.item02],
        typeList: [ItemType(id: 1, name: 'Iron Frame', amount: 50)],
        //
        collectedList: [ItemType(id: 1, name: 'Iron Frame', amount: 35)],
        closedAt: DateTime.now().subtract(Duration(days: 8)),
        deliveryOrder:
            ItemDeliveryOrder(image: AppImages.sampleDO, number: 'AB12258'),
        sentBy: 'Bailey Tan',
        checkedBy: 'Bailey Tan',
        remark: 'Everything is fine'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
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
        const DefaultAppBar(
          hasBackButton: true,
          titleText: AppStrings.history,
          actionIcons: [],
        )
      ],
    ));
  }
}
