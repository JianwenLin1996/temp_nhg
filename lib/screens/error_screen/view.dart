import 'package:flutter/material.dart';

import 'package:nhg_layout/constants/constants.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  _ErrorScreenState createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          AppStrings.errorPageMessage,
          style: CustomTextStyle.error(),
        ),
      ),
    );
  }
}
