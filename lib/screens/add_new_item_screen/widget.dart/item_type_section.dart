import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/models/item/item_type.dart';
import 'package:nhg_layout/providers/providers.dart';
import 'package:nhg_layout/widgets/widgets.dart';

typedef IntCallBack = void Function(int id);

class ItemTypeSection extends StatelessWidget {
  final Function()? onAddNewItem;
  final IntCallBack onDeleteItem;
  final List<ItemType> itemTypeList;
  const ItemTypeSection(
      {Key? key,
      this.onAddNewItem,
      required this.onDeleteItem,
      this.itemTypeList = const <ItemType>[]})
      : super(key: key);

  @override
  build(BuildContext context) {
    Color appThemeColor =
        Provider.of<ThemeNotifier>(context).theme.primaryColor;
    return Column(
      children: [
        Container(
          color: Styles.whiteColor,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 25.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.itemType,
                style: CustomTextStyle.itemStatusStyle(
                    customColor: Styles.blackColor),
              ),
              InkWell(
                onTap: onAddNewItem,
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: appThemeColor,
                      size: 10.w,
                    ),
                    DefaultSizedBox.horizontal(5.w),
                    Text(
                      AppStrings.addNewItem,
                      style: CustomTextStyle.addNewStyle(
                        customColor: appThemeColor,
                        customDecoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 1.h,
          thickness: 1.h,
          color: Colors.transparent,
        ),
        ...itemTypeList.map((val) => ItemTypeRow(
              itemType: val,
              onDeleteItem: onDeleteItem,
            )),
        Container(
          color: Styles.whiteColor,
          width: double.infinity,
          height: 50.h,
        ),
      ],
    );
  }
}

class ItemTypeRow extends StatelessWidget {
  final IntCallBack onDeleteItem;
  final ItemType itemType;
  const ItemTypeRow({
    Key? key,
    required this.onDeleteItem,
    required this.itemType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Styles.whiteColor,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 14.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 5,
                child: Text(
                  itemType.name,
                  style: CustomTextStyle.notificationByStyle(
                      customColor: Styles.blackColor),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'X ' + itemType.amount.toString(),
                  style: CustomTextStyle.notificationByStyle(
                      customColor: Styles.blackColor),
                ),
              ),
              Expanded(
                flex: 5,
                child: InkWell(
                  onTap: () {
                    onDeleteItem(itemType.id);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        AppIcons.delete,
                        width: 12.w,
                      ),
                      DefaultSizedBox.horizontal(8.w),
                      Text(
                        AppStrings.del,
                        style: CustomTextStyle.notificationByStyle(
                          customColor: Styles.delete,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 1.h,
          thickness: 1.h,
          color: Colors.transparent,
        ),
      ],
    );
  }
}
