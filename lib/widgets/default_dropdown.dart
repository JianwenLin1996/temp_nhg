import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nhg_layout/constants/constants.dart';

class DefaultDropdown extends StatelessWidget {
  final String hintText;
  final Function(dynamic) onChanged;
  final List<DropdownMenuItem> itemList;
  final dynamic selectedValue;
  const DefaultDropdown({
    Key? key,
    required this.hintText,
    required this.onChanged,
    required this.itemList,
    this.selectedValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 20.w,
            color: Styles.blackColor,
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 13.h),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFC9CED6)),
              borderRadius: BorderRadius.all(Radius.circular(12.r)))),
      child: DropdownButton(
          value: selectedValue,
          isDense: true,
          hint: Text(
            hintText,
            style: CustomTextStyle.displayRegular(
                fontSize: 16.sp, color: Styles.blackColor),
          ),
          underline: const SizedBox(),
          icon: const SizedBox(),
          onChanged: onChanged,
          items: itemList),
    );
  }
}
