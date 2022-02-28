import 'package:flutter/cupertino.dart';
import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/networking/networking.dart';
import 'package:nhg_layout/utils/build_toast.dart';

class ResponseCheckingHelper {
  static dynamic responseHandling(BuildContext context, dynamic callback,
      {bool shouldExtractData = true,
      bool shouldPop = false,
      bool shouldReturnErrorData = false}) async {
    try {
      final res = await callback();

      return checkResponse(
        context,
        res,
        shouldExtractData,
        shouldPop,
        shouldReturnErrorData,
      );
    } catch (e) {
      if (shouldPop) Navigator.pop(context);

      defaultToast(ApiExceptionMapper.toErrorMessage(e));

      if (e is ConnectionException) {
        defaultToast(AppStrings.noInternet);
      }

      return null;
    }
  }

  static Future<dynamic> checkResponse(BuildContext context, dynamic res,
      bool shouldExtractData, bool shouldPop, bool shouldReturnData) async {
    if (res == null || res['status'] == 0) {
      if (shouldPop) {
        Navigator.pop(context);
      }
      if (res != null) {
        if (shouldReturnData) return res;
        defaultToast(res['message']);
      }
    }

    if (shouldExtractData) return res['data'];

    return res;
  }
}
