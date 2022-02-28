import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

void defaultToast(String? msg) {
  Fluttertoast.showToast(
      msg: msg ?? '', toastLength: Toast.LENGTH_SHORT, fontSize: 14.sp);
}
