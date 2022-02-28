import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/widgets/widgets.dart';

class UploadDOSection extends StatelessWidget {
  final TextEditingController doController;
  const UploadDOSection({
    Key? key,
    required this.doController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.whiteColor,
      padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UploadDORow(
            title: AppStrings.uploadDO,
            titleDescription: AppStrings.deliveryOrder,
          ),
          UploadDORow(
            title: AppStrings.doNumber,
            upload: false,
            controller: doController,
          ),
        ],
      ),
    );
  }
}

class UploadDORow extends StatelessWidget {
  final String title;
  final String? titleDescription;
  final bool upload;
  final TextEditingController? controller;
  const UploadDORow({
    Key? key,
    required this.title,
    this.titleDescription,
    this.upload = true,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: CustomTextStyle.displayMedium(
                              fontSize: 16.sp, color: Styles.itemCategory),
                        ),
                        titleDescription == null
                            ? Container()
                            : Text(
                                titleDescription!,
                                style: CustomTextStyle.displayRegular(
                                    fontSize: 14.sp,
                                    color: Styles.itemCategory),
                              ),
                      ],
                    ),
                  ),
                  Text(
                    ':',
                    style: CustomTextStyle.displayMedium(
                        fontSize: 16.sp, color: Styles.itemCategory),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: upload
                      ? UploadPhotoButton(
                          width: 175.w,
                          onPressed: () {},
                        )
                      : DefaultTextFormField(
                          controller: controller!,
                          borderRadius: 30.r,
                          isLogin: false,
                        )),
            ),
          ],
        ),
        DefaultSizedBox.vertical(23.h)
      ],
    );
  }
}
