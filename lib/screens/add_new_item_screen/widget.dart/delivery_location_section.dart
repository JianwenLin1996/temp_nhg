import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/providers/providers.dart';
import 'package:nhg_layout/routes/routes.dart';
import 'package:nhg_layout/widgets/default_dropdown.dart';
import 'package:nhg_layout/widgets/widgets.dart';
import 'package:provider/provider.dart';

class DeliveryLocationSection extends StatelessWidget {
  const DeliveryLocationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color appThemeColor =
        Provider.of<ThemeNotifier>(context).theme.primaryColor;
    return Column(
      children: [
        Container(
          color: Styles.whiteColor,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 25.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.location,
                style: CustomTextStyle.itemStatusStyle(
                    customColor: Styles.blackColor),
              ),
              DefaultSizedBox.vertical(25.h),
              Text(
                AppStrings.location,
                style: CustomTextStyle.notificationByStyle(),
              ),
              DefaultSizedBox.vertical(10.h),
              // DropdownButtonFormField(
              //     onChanged: (int) {},
              //     decoration: InputDecoration(
              //         suffixIcon: Icon(
              //           Icons.keyboard_arrow_down_rounded,
              //           size: 20.w,
              //           color: Styles.blackColor,
              //         ),
              //         contentPadding: EdgeInsets.symmetric(
              //             horizontal: 20.w, vertical: 13.h),
              //         border: OutlineInputBorder(
              //             borderSide:
              //                 const BorderSide(color: Color(0xFFC9CED6)),
              //             borderRadius:
              //                 BorderRadius.all(Radius.circular(12.r)))),
              //     hint: Text(
              //       AppStrings.selectLocation,
              //       style: CustomTextStyle.generalInputStyle(
              //           color: Styles.blackColor),
              //     ),
              //     items: const [
              //       DropdownMenuItem(
              //         child: Text('one'),
              //         value: 1,
              //       ),
              //       DropdownMenuItem(child: Text('two'), value: 2)
              //     ]),

              DefaultDropdown(
                hintText: AppStrings.selectLocation,
                onChanged: (val) {},
                itemList: const [
                  DropdownMenuItem(
                    child: Text('one'),
                    value: 1,
                  ),
                  DropdownMenuItem(child: Text('two'), value: 2)
                ],
              ),
              DefaultSizedBox.vertical(31.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.noDestination,
                    style: CustomTextStyle.noDestinationStyle(),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RouteList.newLocationScreen);
                    },
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
              DefaultSizedBox.vertical(10.h),
              Text(
                AppStrings.newAddress,
                style: CustomTextStyle.noDestinationStyle(
                    customColor: Styles.profileInfoGrey2),
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
    );
  }
}
