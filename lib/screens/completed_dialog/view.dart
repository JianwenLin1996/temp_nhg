import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/constants/icon_image_path.dart';
import 'package:nhg_layout/models/item/item_type.dart';
import 'package:nhg_layout/routes/route_list.dart';
import 'package:nhg_layout/widgets/widgets.dart';

class CompletedDialog extends StatefulWidget {
  const CompletedDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<CompletedDialog> createState() => _CompletedDialogState();
}

class _CompletedDialogState extends State<CompletedDialog> {
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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 45.h, horizontal: 65.w),
            decoration: BoxDecoration(
              color: Styles.whiteColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Material(
              color: Styles.whiteColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.completed,
                    width: 97.w,
                  ),
                  DefaultSizedBox.vertical(21.h),
                  Text(
                    AppStrings.completed,
                    style: CustomTextStyle.pageTitleStyle(),
                  ),
                  DefaultSizedBox.vertical(8.h),
                  Text(
                    AppStrings.completeMessage,
                    style: CustomTextStyle.pageDescriptionStyle(),
                  ),
                  DefaultSizedBox.vertical(26.h),
                  DefaultButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, RouteList.homeScreen, (route) => false);
                      },
                      buttonText: 'OK')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
