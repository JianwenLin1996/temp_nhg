import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/screens/login_screen/view.dart';
import 'package:nhg_layout/widgets/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 1));

      // Navigator.pushNamedAndRemoveUntil(
      //     context, RouteList.loginScreen, (route) => false);
      Navigator.pushAndRemoveUntil(
          context, FadeRoute(page: const LoginScreen()), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
                child: Center(
                    child: DefaultLogo(
              width: 240.w,
              height: 102.h,
            ))),
            Text(
              AppStrings.copyRightMessage,
              style: CustomTextStyle.textLight(fontSize: 11.sp),
            ),
            DefaultSizedBox.vertical(21.h)
          ],
        ),
      ),
    );
  }
}
