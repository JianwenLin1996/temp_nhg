import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nhg_layout/constants/app_strings.dart';

import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/constants/styles.dart';
import 'package:nhg_layout/models/item/item_status.dart';
import 'package:nhg_layout/models/item/item_type.dart';
import 'package:nhg_layout/models/models.dart';
import 'package:nhg_layout/routes/routes.dart';
import 'package:nhg_layout/utils/utils.dart';
import 'package:nhg_layout/widgets/widgets.dart';

class ItemCard extends StatelessWidget {
  final ItemDetail item;
  const ItemCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RouteList.itemDetailScreen,
            arguments: item);
      },
      child: Column(
        children: [
          ItemCardStatusSection(id: item.id, status: item.status),
          ItemCardInfoSection(item: item)
        ],
      ),
    );
  }
}

class ItemCardStatusSection extends StatelessWidget {
  final String id;
  final ItemStatus status;
  const ItemCardStatusSection({
    Key? key,
    required this.id,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: status.id == 0 ? Styles.statusSentOut : Styles.statusCollected,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r))),
      padding: EdgeInsets.only(left: 24.w, right: 13.w),
      height: 28.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.itemId + ': ' + id,
            style: CustomTextStyle.displayRegular(
                fontSize: 13.sp, color: Styles.whiteColor),
          ),
          Text(
            status.label,
            style: CustomTextStyle.displaySemiBold(
                fontSize: 15.sp, color: Styles.whiteColor),
          )
        ],
      ),
    );
  }
}

class ItemCardInfoSection extends StatelessWidget {
  final ItemDetail item;
  const ItemCardInfoSection({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Styles.whiteColor,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.r))),
      padding:
          EdgeInsets.only(top: 13.h, bottom: 13.h, left: 24.w, right: 13.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Column(
            children: [
              ItemCardRow(
                iconPath: AppIcons.date,
                infoCategory: AppStrings.createDate,
                normalInfo:
                    DateFormatUtils.ddMMMyyyFormat1(context, item.createdAt),
              ),
              item.closedAt == null
                  ? ItemCardRow(
                      iconPath: AppIcons.location,
                      infoCategory: AppStrings.location,
                      normalInfo: item.location.name,
                    )
                  : ItemCardRow(
                      iconPath: AppIcons.date,
                      infoCategory: AppStrings.closeDate,
                      normalInfo: DateFormatUtils.ddMMMyyyFormat1(
                          context, item.closedAt!),
                    ),
              ItemCardRow(
                iconPath: AppIcons.itemType,
                infoCategory: AppStrings.itemType,
                listInfo: item.typeList,
              ),
            ],
          )),
          Container(
            width: 67.w,
            height: 67.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.r))),
            child: Image.asset(
              item.imageList[0],
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}

class ItemCardRow extends StatelessWidget {
  final String iconPath;
  final String infoCategory;
  final String? normalInfo;
  final List<ItemType> listInfo;
  const ItemCardRow({
    Key? key,
    required this.iconPath,
    required this.infoCategory,
    this.normalInfo,
    this.listInfo = const <ItemType>[],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              iconPath,
              width: 13.w,
            ),
            DefaultSizedBox.horizontal(10.w),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      infoCategory,
                      style: CustomTextStyle.displayRegular(
                          fontSize: 13.sp, color: Styles.itemCategory),
                    ),
                  ),
                  Text(
                    ': ',
                    style: CustomTextStyle.displayRegular(
                        fontSize: 13.sp, color: Styles.itemCategory),
                  ),
                ],
              ),
            ),
            listInfo.isEmpty
                ? Expanded(
                    flex: 2,
                    child: Text(
                      normalInfo ?? '',
                      style: CustomTextStyle.displayMedium(
                          fontSize: 14.sp, color: Styles.profileInfoDark),
                    ),
                  )
                : Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...listInfo.map(
                          (val) => Text(
                            val.name + ' x ' + val.amount.toString(),
                            style: CustomTextStyle.displayMedium(
                                fontSize: 14.sp, color: Styles.profileInfoDark),
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
        DefaultSizedBox.vertical(10.h)
      ],
    );
  }
}
