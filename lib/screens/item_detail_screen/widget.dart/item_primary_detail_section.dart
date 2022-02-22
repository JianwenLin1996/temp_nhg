import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/constants/styles.dart';
import 'package:nhg_layout/models/models.dart';
import 'package:nhg_layout/utils/dateformat_utils.dart';
import 'package:nhg_layout/widgets/widgets.dart';

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
            descriptionList: detail.typeList,
          ),
          ItemDetailRow(
              title: AppStrings.createDate,
              description:
                  DateFormatUtils.ddMMMyyyFormat1(context, detail.createdAt)),
          ItemDetailRow(title: AppStrings.location, location: detail.location),
          ItemDetailRow(
              title: AppStrings.pic, description: detail.personInCharge),
          ItemDetailRow(title: AppStrings.contact, description: detail.contact),
          detail.deliveryOrder == null
              ? Container()
              : ItemDetailRow(
                  title: AppStrings.deliveryOrder,
                  doImage: detail.deliveryOrder!.image,
                ),
          detail.deliveryOrder == null
              ? Container()
              : ItemDetailRow(
                  title: AppStrings.doNumber,
                  description: detail.deliveryOrder!.number),
          DefaultSizedBox.vertical(9.h),
        ],
      ),
    );
  }
}

class ItemDetailRow extends StatelessWidget {
  final String title;
  final List<ItemType> descriptionList;
  final String description;
  final ItemDeliveryLocation? location;
  final String? doImage;
  ItemDetailRow(
      {Key? key,
      required this.title,
      descriptionList,
      this.description = '',
      this.location,
      this.doImage})
      : this.descriptionList = descriptionList ?? [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: CustomTextStyle.detailStatusStyle(
                          color: Styles.itemCategory),
                    ),
                  ),
                  Text(
                    ':',
                    style: CustomTextStyle.detailStatusStyle(
                        color: Styles.itemCategory),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: EdgeInsets.only(left: 12.w),
                child: descriptionList.isEmpty
                    ? location == null
                        ? doImage == null
                            ? Text(
                                description,
                                style: CustomTextStyle.generalInputStyle(
                                    color: Styles.blackColor),
                              )
                            : Container(
                                width: 86.w,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.r))),
                                child: Image.asset(
                                  doImage!,
                                ),
                              )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                location!.name,
                                style: CustomTextStyle.detailStatusStyle(
                                    color: Styles.blackColor),
                              ),
                              Text(
                                location!.address,
                                style: CustomTextStyle.generalInputStyle(
                                    color: const Color(0xFF9E9E9E)),
                              )
                            ],
                          )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...descriptionList.map(
                            (val) => Text(
                              val.name + ' x' + val.amount.toString(),
                              style: CustomTextStyle.generalInputStyle(
                                  color: Styles.blackColor),
                            ),
                          )
                        ],
                      ),
              ),
            ),
          ],
        ),
        DefaultSizedBox.vertical(10.h)
      ],
    );
  }
}
