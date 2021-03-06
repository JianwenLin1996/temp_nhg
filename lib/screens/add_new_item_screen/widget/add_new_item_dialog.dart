import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/models/models.dart';
import 'package:nhg_layout/widgets/widgets.dart';

class AddNewItemDialog extends StatefulWidget {
  const AddNewItemDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNewItemDialog> createState() => _AddNewItemDialogState();
}

class _AddNewItemDialogState extends State<AddNewItemDialog> {
  List<DropdownMenuItem> itemList = [
    DropdownMenuItem(
      child: const Text('Wooden Frame'),
      value: ItemType(id: 0, name: 'Wooden Frame', amount: 0),
    ),
    DropdownMenuItem(
      child: const Text('Iron Frame'),
      value: ItemType(id: 1, name: 'Iron Frame', amount: 0),
    )
  ];
  late ItemType selectedItem;
  TextEditingController quantityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedItem = itemList.first.value;
  }

  @override
  void dispose() {
    quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 10.h, left: 16.w, right: 16.w),
              decoration: BoxDecoration(
                color: Styles.whiteColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Material(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          AppIcons.cancelRounded,
                          width: 30.w,
                        ),
                      ),
                    ),
                    DefaultSizedBox.vertical(25.h),
                    Text(
                      AppStrings.item,
                      style: CustomTextStyle.textRegular(fontSize: 13.sp),
                    ),
                    DefaultSizedBox.vertical(10.h),
                    DefaultDropdown(
                      selectedValue: selectedItem,
                      hintText: itemList.first.value.name,
                      onChanged: (item) {
                        setState(() {
                          selectedItem = item;
                        });
                      },
                      itemList: itemList,
                    ),
                    DefaultSizedBox.vertical(36.h),
                    Text(
                      AppStrings.quantity,
                      style: CustomTextStyle.textRegular(fontSize: 13.sp),
                    ),
                    DefaultSizedBox.vertical(10.h),
                    DefaultTextFormField(
                      controller: quantityController,
                      isLogin: false,
                    ),
                    DefaultSizedBox.vertical(22.h),
                    DefaultButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      buttonText: AppStrings.addItem,
                      borderColor: Styles.uploadImageBorderDark,
                    ),
                    DefaultSizedBox.vertical(37.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
