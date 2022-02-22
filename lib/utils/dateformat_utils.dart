import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFormatUtils {
  ///Format into: 12 Apr 2021
  static String ddMMMyyyFormat1(BuildContext context, DateTime date) {
    return DateFormat('dd MMM yyy').format(date);
  }

  static String dateTimeDifferenceFormatter(DateTime datetime) {
    int minutePass = DateTime.now().difference(datetime).inMinutes;

    if (minutePass < 60) {
      return minutePass <= 1
          ? '$minutePass minute ago.'
          : '$minutePass minutes ago.';
    } else {
      int hourPass = (minutePass / 60).floor();

      if (hourPass < 24) {
        return hourPass <= 1 ? '$hourPass hour ago.' : '$hourPass hours ago.';
      } else {
        int dayPass = (hourPass / 24).floor();

        return dayPass <= 1 ? '$dayPass day ago.' : '$dayPass days ago.';
      }
    }
  }
}
