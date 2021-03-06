import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nhg_layout/constants/app_strings.dart';
import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/models/models.dart';
import 'package:nhg_layout/utils/utils.dart';
import 'package:nhg_layout/widgets/widgets.dart';
import 'package:nhg_layout/screens/add_new_item_screen/widget/widget.dart';

class AddNewItemScreen extends StatefulWidget {
  const AddNewItemScreen({Key? key}) : super(key: key);

  @override
  _AddNewItemScreenState createState() => _AddNewItemScreenState();
}

class _AddNewItemScreenState extends State<AddNewItemScreen> {
  List<ItemType> itemTypeList = [
    ItemType(id: 0, name: 'Wooden Frame', amount: 100),
    ItemType(id: 1, name: 'Iron Frame', amount: 80),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                    child: Container(
                        // whole screen
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0.0, 0.3],
                                colors: Styles.emptyBackgroundColor)),
                        child: SingleChildScrollView(
                          // to avoid overflow
                          child: Column(
                            children: [
                              DefaultSizedBox.vertical(104.h),
                              const UploadPhotoSection(),
                              DefaultSizedBox.vertical(12.h),
                              ItemTypeSection(
                                itemTypeList: itemTypeList,
                                onDeleteItem: (id) {
                                  setState(() {
                                    itemTypeList.removeWhere(
                                        (element) => element.id == id);
                                  });
                                },
                                onAddNewItem: () {
                                  onAddNewItemPressed(context);
                                },
                              ),
                              DefaultSizedBox.vertical(12.h),
                              const DeliveryLocationSection()
                            ],
                          ),
                        )
                        // const EmptyListDisplay(),
                        ))
              ],
            ),
            const DefaultAppBar(
              hasBackButton: true,
              backIcon: AppIcons.cancel,
              titleText: AppStrings.addNewItem,
              actionIcons: [],
            )
          ],
        ));
  }
}
