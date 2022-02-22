import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nhg_layout/constants/app_strings.dart';
import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/constants/icon_image_path.dart';
import 'package:nhg_layout/constants/styles.dart';
import 'package:nhg_layout/models/models.dart';
import 'package:nhg_layout/providers/providers.dart';
import 'package:nhg_layout/screens/add_new_item_screen/widget.dart/item_type_section.dart';
import 'package:nhg_layout/screens/add_new_item_screen/widget.dart/upload_photo_section.dart';
import 'package:nhg_layout/screens/home_screen/widget/item_card.dart';
import 'package:nhg_layout/screens/home_screen/widget/widget.dart';
import 'package:nhg_layout/screens/profile_screen/view.dart';
import 'package:nhg_layout/widgets/widgets.dart';
import 'package:provider/provider.dart';

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
    Color appThemeColor =
        Provider.of<ThemeNotifier>(context).theme.primaryColor;
    return Scaffold(
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
                    child: Column(
                      children: [
                        DefaultSizedBox.vertical(104.h),
                        const UploadPhotoSection(),
                        DefaultSizedBox.vertical(12.h),
                        ItemTypeSection(
                          itemTypeList: itemTypeList,
                          onDeleteItem: (id) {
                            setState(() {
                              itemTypeList
                                  .removeWhere((element) => element.id == id);
                            });
                          },
                        ),
                        DefaultSizedBox.vertical(12.h),
                        Column(
                          children: [
                            Container(
                              color: Styles.whiteColor,
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 28.w, vertical: 25.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppStrings.location,
                                    style: CustomTextStyle.itemStatusStyle(
                                        color: Styles.blackColor),
                                  ),
                                  DefaultSizedBox.vertical(25.h),
                                  Text(
                                    AppStrings.location,
                                    style:
                                        CustomTextStyle.notificationByStyle(),
                                  ),
                                  DefaultSizedBox.vertical(10.h),
                                  // DropdownButtonFormField(
                                  //     decoration: InputDecoration(
                                  //         suffixIcon: Icon(
                                  //           Icons.keyboard_arrow_down_rounded,
                                  //           size: 20.w,
                                  //           color: Styles.blackColor,
                                  //         ),
                                  //         contentPadding: EdgeInsets.symmetric(
                                  //             horizontal: 20.w, vertical: 13.h),
                                  //         border: OutlineInputBorder(
                                  //             borderSide: const BorderSide(
                                  //                 color: Color(0xFFC9CED6)),
                                  //             borderRadius: BorderRadius.all(
                                  //                 Radius.circular(12.r)))),
                                  //     hint: Text(
                                  //       AppStrings.selectLocation,
                                  //       style:
                                  //           CustomTextStyle.generalInputStyle(
                                  //               color: Styles.blackColor),
                                  //     ),
                                  //     items: const [
                                  //       DropdownMenuItem(
                                  //         child: Text('one'),
                                  //         value: 1,
                                  //       ),
                                  //       DropdownMenuItem(
                                  //           child: Text('two'), value: 2)
                                  //     ])
                                  InputDecorator(
                                    decoration: InputDecoration(
                                        suffixIcon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          size: 20.w,
                                          color: Styles.blackColor,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 20.w, vertical: 13.h),
                                        border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color(0xFFC9CED6)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.r)))),
                                    child: DropdownButton(
                                        onTap: () {},
                                        isDense: true,
                                        hint: Text(
                                          AppStrings.selectLocation,
                                          style:
                                              CustomTextStyle.generalInputStyle(
                                                  color: Styles.blackColor),
                                        ),
                                        underline: const SizedBox(),
                                        icon: const SizedBox(),
                                        onChanged: (int? newValue) {},
                                        items: const [
                                          DropdownMenuItem(
                                            child: Text('one'),
                                            value: 1,
                                          ),
                                          DropdownMenuItem(
                                              child: Text('two'), value: 2)
                                        ]),
                                  ),
                                  DefaultSizedBox.vertical(31.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppStrings.noDestination,
                                        style: CustomTextStyle
                                            .noDestinationStyle(),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.add,
                                              color: appThemeColor,
                                              size: 10.w,
                                            ),
                                            DefaultSizedBox.horizontal(5.w),
                                            Text(
                                              AppStrings.newLocation,
                                              style:
                                                  CustomTextStyle.addNewStyle(
                                                color: appThemeColor,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  DefaultSizedBox.vertical(10.h),
                                  Text(
                                    AppStrings.newAddress,
                                    style: CustomTextStyle.noDestinationStyle(
                                        color: Styles.profileInfoGrey2),
                                  ),
                                  DefaultSizedBox.vertical(25.h),
                                  DefaultButton(
                                      bgColor: appThemeColor,
                                      borderColor: const Color(0xFF140E7D),
                                      buttonText: AppStrings.createItem)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
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
