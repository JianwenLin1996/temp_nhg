import 'package:flutter/material.dart';
import 'package:nhg_layout/constants/app_strings.dart';
import 'package:nhg_layout/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nhg_layout/constants/styles.dart';
import 'package:nhg_layout/providers/theme_provider.dart';
import 'package:nhg_layout/routes/routes.dart';
import 'package:nhg_layout/screens/login_screen/widget/widget.dart';
import 'package:nhg_layout/widgets/default_sized_box.dart';
import 'package:nhg_layout/widgets/widgets.dart';
import 'package:provider/provider.dart';

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
    // TODO: implement dispose
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeNotifier _theme = Provider.of<ThemeNotifier>(context);
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
              LoginButton(buttonText: AppStrings.sendNewPassword),
              DefaultSizedBox.vertical(40.h),
              LoginButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, RouteList.loginScreen);
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
