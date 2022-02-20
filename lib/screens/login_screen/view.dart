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

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Color appThemeColor =
        Provider.of<ThemeNotifier>(context).theme.primaryColor;
    return LoginImageBGContainer(
      child: LoginContainer(
        title: AppStrings.welcomeBack,
        description: AppStrings.loginMessage,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoginInputField(
                  title: AppStrings.userNameorEmail,
                  controller: userNameController,
                  hintText: AppStrings.enterUserNameorEmail),
              LoginInputField(
                  title: AppStrings.password,
                  controller: passwordController,
                  hintText: AppStrings.enterPassword),
              LoginButton(buttonText: AppStrings.login),
              DefaultSizedBox.vertical(40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.popAndPushNamed(
                          context, RouteList.resetPasswordScreen);
                    },
                    child: Text(
                      AppStrings.forgotPassword,
                      style:
                          CustomTextStyle.categoryTitle(color: appThemeColor),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
