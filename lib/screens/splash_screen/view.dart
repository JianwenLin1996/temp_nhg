import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/constants/styles.dart';
import 'package:nhg_layout/routes/routes.dart';
import 'package:nhg_layout/widgets/default_sized_box.dart';
import 'package:nhg_layout/widgets/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 3));
      // Navigator.pushNamedAndRemoveUntil(
      //     context, RouteList.loginScreen, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const Expanded(child: Center(child: DefaultLogo())),
            Text(
              AppStrings.copyRightMessage,
              style: CustomTextStyle.titleDescription(color: Styles.greyColor),
            ),
            DefaultSizedBox.vertical(25.h)
          ],
        ),
      ),
    );
  }
}
