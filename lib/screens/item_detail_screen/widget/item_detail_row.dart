import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/models/models.dart';
import 'package:nhg_layout/widgets/widgets.dart';

class ItemDetailRow extends StatelessWidget {
  final String title;
  // final List<ItemType> descriptionList;
  // final String description;
  // final ItemDeliveryLocation? location;
  // final String? doImage;
  // final ItemStatus? status;
  final dynamic info;
  final bool isNull;
  final bool isImage;
  const ItemDetailRow({
    Key? key,
    required this.title,
    required this.info,
    descriptionList,
    this.isNull = false,
    this.isImage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isNull
        ? Container()
        : Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: CustomTextStyle.detailStatusStyle(
                                customColor: Styles.itemCategory),
                          ),
                        ),
                        Text(
                          ':',
                          style: CustomTextStyle.detailStatusStyle(
                              customColor: Styles.itemCategory),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Padding(
                        padding: EdgeInsets.only(left: 12.w),
                        child: isImage
                            ? Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width: 86.w,
                                  height: 86.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.r))),
                                  child: Image.asset(
                                    info,
                                  ),
                                ),
                              )
                            : itemDetailMapper(info)
                        // descriptionList.isEmpty
                        //     ? location == null
                        //         ? doImage == null
                        //             ? status == null
                        //                 ? Text(
                        //                     description,
                        //                     style:
                        //                         CustomTextStyle.generalInputStyle(
                        //                             color: Styles.blackColor),
                        //                   )
                        //                 : Align(
                        //                     alignment: Alignment.centerLeft,
                        //                     child: Container(
                        //                       width: 78.w,
                        //                       height: 28.h,
                        //                       decoration: BoxDecoration(
                        //                           borderRadius: BorderRadius.all(
                        //                               Radius.circular(8.r)),
                        //                           color: status!.id == 0
                        //                               ? Styles.statusSentOut
                        //                               : Styles.statusCollected),
                        //                       child: Center(
                        //                         child: Text(
                        //                           status!.label,
                        //                           style: CustomTextStyle
                        //                               .pageDescriptionStyle(
                        //                                   color:
                        //                                       Styles.whiteColor),
                        //                         ),
                        //                       ),
                        //                     ),
                        //                   )
                        //             : Align(
                        //                 alignment: Alignment.centerLeft,
                        //                 child: Container(
                        //                   width: 86.w,
                        //                   height: 86.w,
                        //                   decoration: BoxDecoration(
                        //                       borderRadius: BorderRadius.all(
                        //                           Radius.circular(5.r))),
                        //                   child: Image.asset(
                        //                     doImage!,
                        //                   ),
                        //                 ),
                        //               )
                        //         : Column(
                        //             crossAxisAlignment: CrossAxisAlignment.start,
                        //             children: [
                        //               Text(
                        //                 location!.name,
                        //                 style: CustomTextStyle.detailStatusStyle(
                        //                     color: Styles.blackColor),
                        //               ),
                        //               Text(
                        //                 location!.address,
                        //                 style: CustomTextStyle.generalInputStyle(
                        //                     color: const Color(0xFF9E9E9E)),
                        //               )
                        //             ],
                        //           )
                        //     : Column(
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //           ...descriptionList.map(
                        //             (val) => Text(
                        //               val.name + ' x' + val.amount.toString(),
                        //               style: CustomTextStyle.generalInputStyle(
                        //                   color: Styles.blackColor),
                        //             ),
                        //           )
                        //         ],
                        //       ),

                        ),
                  ),
                ],
              ),
              DefaultSizedBox.vertical(10.h)
            ],
          );
  }
}

Widget itemDetailMapper(dynamic item) {
  switch (item.runtimeType) {
    case String:
      return Text(
        item,
        style:
            CustomTextStyle.generalInputStyle(customColor: Styles.blackColor),
      );
    case ItemDeliveryLocation:
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.name,
            style: CustomTextStyle.detailStatusStyle(
                customColor: Styles.blackColor),
          ),
          Text(
            item.address,
            style: CustomTextStyle.generalInputStyle(
                customColor: const Color(0xFF9E9E9E)),
          )
        ],
      );
    case List:
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...item.map(
            (val) => Text(
              val.name + ' x' + val.amount.toString(),
              style: CustomTextStyle.generalInputStyle(
                  customColor: Styles.blackColor),
            ),
          )
        ],
      );
    case ItemStatus:
      return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: 78.w,
          height: 28.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
              color:
                  item.id == 0 ? Styles.statusSentOut : Styles.statusCollected),
          child: Center(
            child: Text(
              item.label,
              style: CustomTextStyle.pageDescriptionStyle(
                  customColor: Styles.whiteColor),
            ),
          ),
        ),
      );
    case Image:
      return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: 86.w,
          height: 86.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.r))),
          child: Image.asset(
            item,
          ),
        ),
      );
    default:
      return Text(
        'test',
        style:
            CustomTextStyle.generalInputStyle(customColor: Styles.blackColor),
      );
  }
}
