import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/constants/styles.dart';
import 'package:nhg_layout/models/models.dart';
import 'package:nhg_layout/screens/item_detail_screen/widget.dart/item_detail_row.dart';
import 'package:nhg_layout/utils/dateformat_utils.dart';

class ItemPrimaryDetailSection extends StatelessWidget {
  final ItemDetail detail;
  const ItemPrimaryDetailSection({
    Key? key,
    required this.detail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.whiteColor,
      padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemDetailRow(
            title: AppStrings.item,
            info: detail.typeList,
          ),
          ItemDetailRow(
              title: AppStrings.createDate,
              info: DateFormatUtils.ddMMMyyyFormat1(context, detail.createdAt)),
          ItemDetailRow(title: AppStrings.location, info: detail.location),
          ItemDetailRow(title: AppStrings.pic, info: detail.personInCharge),
          ItemDetailRow(title: AppStrings.contact, info: detail.contact),
          ItemDetailRow(
            title: AppStrings.deliveryOrder,
            info: detail.deliveryOrder?.image,
            isNull: detail.deliveryOrder == null,
            isImage: true,
          ),
          ItemDetailRow(
            title: AppStrings.doNumber,
            info: detail.deliveryOrder?.number ?? '',
            isNull: detail.deliveryOrder == null,
          ),
        ],
      ),
    );
  }
}
