import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nhg_layout/constants/app_strings.dart';
import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/constants/icon_image_path.dart';
import 'package:nhg_layout/screens/home_screen/widget/empty_list_display.dart';
import 'package:nhg_layout/widgets/widgets.dart';

class HomeAddList extends StatefulWidget {
  const HomeAddList({Key? key}) : super(key: key);

  @override
  State<HomeAddList> createState() => _HomeAddListState();
}

class _HomeAddListState extends State<HomeAddList>
    with AutomaticKeepAliveClientMixin<HomeAddList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 0.3],
                      colors: Styles.emptyBackgroundColor)),
              child: const Center(
                child: EmptyListDisplay(),
              ),
            ))
          ],
        ),
        const DefaultAppBar(
          hasBackButton: false,
          titleText: AppStrings.myItem,
          actionIcons: [
            AppBarActionIcon(
              path: AppIcons.featherBell,
            ),
            AppBarActionIcon(
              path: AppIcons.refresh,
            )
          ],
        )
      ],
    );
  }
}
