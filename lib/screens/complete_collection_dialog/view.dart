import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/models/models.dart';
import 'package:nhg_layout/utils/utils.dart';
import 'package:nhg_layout/widgets/widgets.dart';

class CompleteCollectionDialog extends StatefulWidget {
  const CompleteCollectionDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<CompleteCollectionDialog> createState() =>
      _CompleteCollectionDialogState();
}

class _CompleteCollectionDialogState extends State<CompleteCollectionDialog> {
  List<DropdownMenuItem> itemTypeList = [
    DropdownMenuItem(
      child: const Text('Wooden Frame'),
      value: ItemType(id: 0, name: 'Wooden Frame', amount: 100),
    ),
    DropdownMenuItem(
      child: const Text('Iron Frame'),
      value: ItemType(id: 1, name: 'Iron Frame', amount: 80),
    )
  ];
  late ItemType selectedItem;
  TextEditingController quantityController = TextEditingController();
  TextEditingController remarkController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedItem = itemTypeList.first.value;
  }

  @override
  void dispose() {
    quantityController.dispose();
    remarkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: 12.w,
              right: 12.w,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 18.h, left: 16.w, right: 16.w),
              decoration: BoxDecoration(
                color: Styles.whiteColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Material(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppStrings.collectedStatus,
                            style: CustomTextStyle.textSemiBold(
                                fontSize: 15.sp,
                                color: const Color(0xFF878787))),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            AppIcons.cancelRounded,
                            width: 30.w,
                          ),
                        ),
                      ],
                    ),
                    DefaultSizedBox.vertical(25.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                            flex: 3,
                            child: Text(AppStrings.itemCollect + ' :')),
                        Expanded(
                          flex: 7,
                          child: Column(
                            children: [
                              ...itemTypeList.map((val) => Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        val.value.name,
                                        style: CustomTextStyle.displayRegular(
                                            fontSize: 16.sp,
                                            color: Styles.blackColor),
                                      ),
                                      Text(
                                        '0 / ' + val.value.amount.toString(),
                                        style: CustomTextStyle.displayRegular(
                                            fontSize: 16.sp,
                                            color: Styles.blackColor),
                                      )
                                    ],
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                    DefaultSizedBox.vertical(30.h),
                    Text(
                      AppStrings.selectItem + ' :',
                      style: CustomTextStyle.displayRegular(
                          fontSize: 14.sp, color: Styles.blackColor),
                    ),
                    DefaultSizedBox.vertical(10.h),
                    DefaultDropdown(
                      selectedValue: selectedItem,
                      hintText: itemTypeList.first.value.name,
                      onChanged: (item) {
                        setState(() {
                          selectedItem = item;
                        });
                      },
                      itemList: itemTypeList,
                    ),
                    DefaultSizedBox.vertical(36.h),
                    Text(
                      AppStrings.enterQuantity + ' :',
                      style: CustomTextStyle.displayRegular(
                          fontSize: 14, color: Styles.blackColor),
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
                      buttonText: AppStrings.collected,
                      borderColor: Styles.uploadImageBorderDark,
                    ),
                    DefaultSizedBox.vertical(45.h),
                    Text(
                      AppStrings.remark + ' :',
                      style: CustomTextStyle.displayRegular(
                          fontSize: 14, color: Styles.blackColor),
                    ),
                    DefaultSizedBox.vertical(10.h),
                    DefaultTextFormField(
                      controller: remarkController,
                      line: 3,
                      isLogin: false,
                    ),
                    DefaultSizedBox.vertical(22.h),
                    Center(
                      child: Text(
                        AppStrings.clickCompleteMessage,
                        style: CustomTextStyle.textRegular(fontSize: 13.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    DefaultSizedBox.vertical(18.h),
                    DefaultButton(
                      onPressed: () {
                        onCompletedPressed(context);
                      },
                      buttonText: AppStrings.completedCollection,
                      bgColor: Styles.blackColor,
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
