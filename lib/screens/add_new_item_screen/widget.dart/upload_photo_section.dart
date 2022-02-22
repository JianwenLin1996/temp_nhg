import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/widgets/widgets.dart';

class UploadPhotoSection extends StatefulWidget {
  const UploadPhotoSection({Key? key}) : super(key: key);

  @override
  _UploadPhotoSectionState createState() => _UploadPhotoSectionState();
}

class _UploadPhotoSectionState extends State<UploadPhotoSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.whiteColor,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.addItemPhoto,
            style: CustomTextStyle.itemStatusStyle(color: Styles.blackColor),
          ),
          DefaultSizedBox.vertical(26.h),
          UploadPhotoButton(
            onPressed: () {},
            width: 216.w,
          )
        ],
      ),
    );
  }
}
