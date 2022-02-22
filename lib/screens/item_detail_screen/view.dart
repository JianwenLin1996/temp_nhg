import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nhg_layout/models/models.dart';
import 'package:nhg_layout/screens/item_detail_screen/widget.dart/item_photo_section.dart';
import 'package:nhg_layout/screens/item_detail_screen/widget.dart/item_primary_detail_section.dart';
import 'package:provider/provider.dart';

import 'package:nhg_layout/constants/app_strings.dart';
import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/constants/styles.dart';
import 'package:nhg_layout/providers/providers.dart';
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
    Color appThemeColor =
        Provider.of<ThemeNotifier>(context).theme.primaryColor;
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
                              DefaultSizedBox.vertical(88.h),
                              ItemPhotoSection(
                                  imageList: widget.detail.imageList),
                              DefaultSizedBox.vertical(12.h),
                              ItemPrimaryDetailSection(detail: widget.detail)
                            ],
                          ),
                        )
                        // const EmptyListDisplay(),
                        ))
              ],
            ),
            DefaultAppBar(
              hasBackButton: true,
              titleText: widget.detail.id,
              actionIcons: [],
              actionWidget: InkWell(
                  onTap: () {},
                  child: Text(
                    'Collected>',
                    style: CustomTextStyle.detailStatusStyle(),
                  )),
            )
          ],
        ));
  }
}
