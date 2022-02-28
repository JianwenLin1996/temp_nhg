import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/models/models.dart';
import 'package:nhg_layout/routes/routes.dart';
import 'package:nhg_layout/screens/profile_screen/widget/widget.dart';
import 'package:nhg_layout/widgets/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with AutomaticKeepAliveClientMixin<ProfileScreen> {
  User user = User();

  @override
  void initState() {
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
              ProfileUpperSection(user: user),
              Expanded(
                  child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, -4),
                          blurRadius: 16,
                          color: Color(0x33000014)),
                    ],
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16.r))),
                child: Padding(
                  padding: EdgeInsets.all(23.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Personal Info',
                        style: CustomTextStyle.displayRegular(
                            fontSize: 16.sp, color: Styles.profileInfoGrey2),
                      ),
                      DefaultSizedBox.vertical(30.h),
                      ProfileInfoRow(
                        iconPath: AppIcons.phone,
                        infoTitle: AppStrings.profilePhone,
                        info: user.userPhoneNumber,
                      ),
                      ProfileInfoRow(
                        iconPath: AppIcons.email,
                        infoTitle: AppStrings.profileEmail,
                        info: user.userEmail,
                      ),
                      ProfileInfoRow(
                        iconPath: AppIcons.icNumber,
                        infoTitle: AppStrings.profileIC,
                        info: user.userICNumber,
                      ),
                      const ProfileInfoRow(
                        iconPath: AppIcons.secure,
                        infoTitle: AppStrings.profileICVerification,
                        info: '',
                        status: true,
                      ),
                      ProfileInfoRow(
                        iconPath: AppIcons.password,
                        infoTitle: AppStrings.password,
                        info: '',
                        clickable: true,
                        onTap: () {
                          Navigator.pushNamed(
                              context, RouteList.changePasswordScreen);
                        },
                      ),
                      DefaultSizedBox.vertical(50.h),
                      DefaultButton(
                        onPressed: () {
                          Navigator.popAndPushNamed(
                              context, RouteList.loginScreen);
                        },
                        buttonText: 'Logout',
                        borderRadius: 26.r,
                        bgColor: Styles.whiteColor,
                        textColor: Styles.profileLogout,
                        borderColor: Styles.profileLogout,
                      )
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
        DefaultAppBar(
          hasBackButton: false,
          titleText: AppStrings.myProfile,
          actionIcons: [
            AppBarActionIcon(
              onTap: () {
                Navigator.pushNamed(context, RouteList.notificationScreen);
              },
              path: AppIcons.featherBell,
            ),
          ],
        )
      ],
    );
  }
}

class ProfileUpperSection extends StatelessWidget {
  final User user;
  const ProfileUpperSection({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 121.h, bottom: 38.h),
      child: Column(
        children: [
          Stack(children: [
            CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 45.w,
                child: Image.asset(AppImages.avatar)),
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
          DefaultSizedBox.vertical(10.h),
          Text(
            user.userName,
            style: CustomTextStyle.displayBold(
                fontSize: 22.sp, color: Styles.profileInfoDark),
          ),
          DefaultSizedBox.vertical(6.h),
          Text(
            user.userEmail,
            style: CustomTextStyle.displayRegular(
                fontSize: 16.sp, color: Styles.profileInfoGrey1),
          ),
        ],
      ),
    );
  }
}
