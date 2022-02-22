import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/constants/styles.dart';
import 'package:nhg_layout/models/models.dart';
import 'package:nhg_layout/screens/item_detail_screen/widget.dart/item_detail_row.dart';
import 'package:nhg_layout/utils/dateformat_utils.dart';
import 'package:nhg_layout/widgets/widgets.dart';

class ItemSecondaryDetailSection extends StatelessWidget {
  final ItemDetail detail;
  const ItemSecondaryDetailSection({
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
          ItemDetailRow(title: AppStrings.status, info: detail.status),
          ItemDetailRow(title: AppStrings.sentBy, info: detail.sentBy),
          ItemDetailRow(
            title: AppStrings.collectedItem,
            info: detail.collectedList,
            isNull: detail.collectedList == null,
          ),
          ItemDetailRow(
            title: AppStrings.completeDate,
            info: DateFormatUtils.ddMMMyyyFormat1(
                context, detail.closedAt ?? DateTime.now()),
            isNull: detail.closedAt == null,
          ),
          ItemDetailRow(
            title: AppStrings.collectedBy,
            info: detail.collectedBy ?? '',
            isNull: detail.collectedBy == null,
          ),
          ItemDetailRow(
            title: AppStrings.remark,
            info: detail.remark ?? '',
            isNull: detail.remark == null,
          ),
        ],
      ),
    );
  }
}
