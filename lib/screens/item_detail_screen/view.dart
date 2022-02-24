import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nhg_layout/models/models.dart';
import 'package:nhg_layout/screens/item_detail_screen/widget/widget.dart';
import 'package:nhg_layout/utils/utils.dart';
import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/widgets/widgets.dart';

class ItemDetailScreen extends StatefulWidget {
  final ItemDetail detail;
  const ItemDetailScreen({
    Key? key,
    required this.detail,
  }) : super(key: key);

  @override
  _ItemDetailScreenState createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController doController = TextEditingController();
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
                        child: GestureDetector(
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                          child: SingleChildScrollView(
                            // to avoid overflow
                            child: Column(
                              children: [
                                DefaultSizedBox.vertical(88.h),
                                ItemPhotoSection(
                                    imageList: widget.detail.imageList),
                                DefaultSizedBox.vertical(12.h),
                                ItemPrimaryDetailSection(detail: widget.detail),
                                DefaultSizedBox.vertical(12.h),
                                ItemSecondaryDetailSection(
                                    detail: widget.detail),
                                DefaultSizedBox.vertical(12.h),
                                widget.detail.status.id == 0
                                    ? Column(
                                        children: [
                                          UploadDOSection(
                                            doController: doController,
                                          ),
                                          DefaultSizedBox.vertical(12.h)
                                        ],
                                      )
                                    : Container(),
                                DefaultSizedBox.vertical(12.h),
                                Container(
                                  color: Styles.whiteColor,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 28.w, vertical: 25.h),
                                  child: DefaultButton(
                                      onPressed: () {
                                        onCollectedBackPressed(context);
                                      },
                                      textStyle:
                                          CustomTextStyle.greenButtonStyle(),
                                      verticalPadding: 20.h,
                                      bgColor: const Color(0xFF63B90C),
                                      borderColor: const Color(0XFF305D02),
                                      buttonText: AppStrings.itemCollectedBack),
                                )
                              ],
                            ),
                          ),
                        )
                        // const EmptyListDisplay(),
                        ))
              ],
            ),
            DefaultAppBar(
              hasBackButton: true,
              titleText: widget.detail.id,
              actionIcons: const [],
              actionWidget: widget.detail.status.id == 0
                  ? InkWell(
                      onTap: () {},
                      child: Text(
                        'Collected>',
                        style: CustomTextStyle.detailStatusStyle(),
                      ))
                  : null,
            )
          ],
        ));
  }
}
