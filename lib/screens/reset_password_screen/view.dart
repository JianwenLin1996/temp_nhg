import 'package:flutter/material.dart';
import 'package:nhg_layout/constants/app_strings.dart';
import 'package:nhg_layout/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nhg_layout/routes/routes.dart';
import 'package:nhg_layout/screens/login_screen/widget/widget.dart';
import 'package:nhg_layout/widgets/widgets.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoginImageBGContainer(
      child: LoginContainer(
        title: AppStrings.resetYoutPassword,
        description: AppStrings.resetYourPasswordMessage,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoginInputField(
                  title: AppStrings.email,
                  controller: emailController,
                  hintText: AppStrings.emailAddress),
              DefaultSizedBox.vertical(29.h),
              const DefaultButton(buttonText: AppStrings.sendNewPassword),
              DefaultSizedBox.vertical(16.h),
              DefaultButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, RouteList.loginScreen);
                },
                buttonText: AppStrings.backToLogin,
                bgColor: Styles.whiteColor,
                textColor: Styles.blackColor,
                borderColor: Styles.blackColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
