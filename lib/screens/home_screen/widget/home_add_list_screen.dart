import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nhg_layout/constants/app_strings.dart';
import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/constants/icon_image_path.dart';
import 'package:nhg_layout/routes/routes.dart';
import 'package:nhg_layout/screens/home_screen/widget/empty_list_display.dart';
import 'package:nhg_layout/widgets/widgets.dart';

class HomeAddListScreen extends StatefulWidget {
  const HomeAddListScreen({Key? key}) : super(key: key);

  @override
  State<HomeAddListScreen> createState() => _HomeAddListScreenState();
}

class _HomeAddListScreenState extends State<HomeAddListScreen>
    with AutomaticKeepAliveClientMixin<HomeAddListScreen> {
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
        DefaultAppBar(
          hasBackButton: false,
          titleText: AppStrings.myItem,
          actionIcons: [
            AppBarActionIcon(
              onTap: () {
                Navigator.pushNamed(context, RouteList.notificationScreen);
              },
              path: AppIcons.featherBell,
            ),
            const AppBarActionIcon(
              path: AppIcons.refresh,
            )
          ],
        )
      ],
    );
  }
}
