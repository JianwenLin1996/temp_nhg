import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nhg_layout/constants/app_strings.dart';
import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/constants/icon_image_path.dart';
import 'package:nhg_layout/screens/home_screen/widget/empty_list_display.dart';
import 'package:nhg_layout/widgets/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with AutomaticKeepAliveClientMixin<ProfileScreen> {
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
        SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DefaultSizedBox.vertical(121.h),
              Stack(children: [
                Image.asset(AppImages.avatar),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                        onTap: () {},
                        child: Image.asset(
                          AppImages.camera,
                          width: 28.w,
                        )))
              ]),
              // Expanded(
              //     child: Container(
              //   decoration: const BoxDecoration(
              //       gradient: LinearGradient(
              //           begin: Alignment.topCenter,
              //           end: Alignment.bottomCenter,
              //           stops: [0.0, 0.3],
              //           colors: Styles.emptyBackgroundColor)),
              //   child: const Center(
              //     child: EmptyListDisplay(),
              //   ),
              // ))
            ],
          ),
        ),
        const DefaultAppBar(
          hasBackButton: false,
          titleText: AppStrings.myProfile,
          actionIcons: [
            AppBarActionIcon(
              path: AppIcons.featherBell,
            ),
          ],
        )
      ],
    );
  }
}
