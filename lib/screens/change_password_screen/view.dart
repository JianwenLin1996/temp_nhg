import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/widgets/widgets.dart';
import 'package:nhg_layout/screens/new_location_screen/widget/widget.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: Container(
                      // whole screen
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.0, 0.3],
                              colors: Styles.emptyBackgroundColor)),
                      padding: EdgeInsets.symmetric(horizontal: 28.w),
                      child: SingleChildScrollView(
                        // to avoid overflow
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultSizedBox.vertical(104.h),
                            InputField(
                                controller: oldPasswordController,
                                title: AppStrings.oldPassword),
                            InputField(
                                controller: newPasswordController,
                                title: AppStrings.newPassword),
                            InputField(
                                controller: confirmNewPasswordController,
                                title: AppStrings.confirmNewPassword),
                            DefaultButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              buttonText: AppStrings.resetPassword,
                              borderColor: Styles.profileInfoDark,
                            )
                          ],
                        ),
                      )
                      // const EmptyListDisplay(),
                      ),
                ))
              ],
            ),
            const DefaultAppBar(
              hasBackButton: true,
              // backIcon: AppIcons.cancel,
              titleText: AppStrings.newLocation,
              actionIcons: [],
            )
          ],
        ));
  }
}
