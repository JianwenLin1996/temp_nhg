import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/constants/styles.dart';
import 'package:nhg_layout/widgets/widgets.dart';

class ItemPhotoSection extends StatelessWidget {
  final List<String> imageList;
  const ItemPhotoSection({
    Key? key,
    required this.imageList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Styles.whiteColor,
      padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.itemPhoto,
            style: CustomTextStyle.detailStatusStyle(
                customColor: Styles.itemCategory),
          ),
          DefaultSizedBox.vertical(9.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...imageList.map((val) => Container(
                      padding: EdgeInsets.only(right: 10.w),
                      width: 86.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.r))),
                      child: Image.asset(val),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
