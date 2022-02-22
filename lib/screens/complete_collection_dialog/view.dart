import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/constants/icon_image_path.dart';
import 'package:nhg_layout/models/item/item_type.dart';
import 'package:nhg_layout/widgets/default_dropdown.dart';
import 'package:nhg_layout/widgets/widgets.dart';

class CompleteCollectionDialog extends StatefulWidget {
  CompleteCollectionDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<CompleteCollectionDialog> createState() =>
      _CompleteCollectionDialogState();
}

class _CompleteCollectionDialogState extends State<CompleteCollectionDialog> {
  List<DropdownMenuItem> itemTypeList = [
    DropdownMenuItem(
      child: Text('Wooden Frame'),
      value: ItemType(id: 0, name: 'Wooden Frame', amount: 100),
    ),
    DropdownMenuItem(
      child: Text('Iron Frame'),
      value: ItemType(id: 1, name: 'Iron Frame', amount: 80),
    )
  ];
  late ItemType selectedItem;
  TextEditingController quantityController = TextEditingController();
  TextEditingController remarkController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedItem = itemTypeList.first.value;
  }

  @override
  void dispose() {
    // TODO: implement dispose
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
                            style: CustomTextStyle.addNewStyle(
                                color: Color(0xFF878787))),
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
                        Expanded(
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
                                        style:
                                            CustomTextStyle.generalInputStyle(
                                                color: Styles.blackColor),
                                      ),
                                      Text(
                                        '0 / ' + val.value.amount.toString(),
                                        style:
                                            CustomTextStyle.generalInputStyle(
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
                      style: CustomTextStyle.pageDescriptionStyle(
                          color: Styles.blackColor),
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
                      style: CustomTextStyle.pageDescriptionStyle(
                          color: Styles.blackColor),
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
                      style: CustomTextStyle.pageDescriptionStyle(
                          color: Styles.blackColor),
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
                        style: CustomTextStyle.noDestinationStyle(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    DefaultSizedBox.vertical(18.h),
                    DefaultButton(
                      onPressed: () {},
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
