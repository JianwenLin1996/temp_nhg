import 'package:nhg_layout/constants/app_strings.dart';

class InputValidationsUtils {
  static bool isPhoneNumberFull(String phoneNumber) {
    return RegExp(r"^(\+?6?01)[0-46-9]-*[0-9]{7,8}$").hasMatch(phoneNumber);
  }

  static bool isEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static String? validateEmptyString(String? val) {
    if (val.toString().trim() == "" || val == null) {
      return AppStrings.emptyInputError;
    }

    return null;
  }

  static String? validatePhoneNumber(String? val) {
    if (val.toString().trim() == "") {
      return AppStrings.emptyInputError;
    } else if (!InputValidationsUtils.isPhoneNumberFull(val as String)) {
      return AppStrings.invalidMobileNumberError;
    }

    return null;
  }

  static String? validateConfirmPassword(String? val, String? valToCompare) {
    if (val.toString().trim() == "") {
      return AppStrings.emptyInputError;
    } else if (val != valToCompare) {
      return AppStrings.passwordNotSameError;
    }

    return null;
  }

  static String? validateEmail(String? val) {
    if (val == "") {
      return AppStrings.emptyInputError;
    } else if (!isEmail(val as String)) {
      return AppStrings.invalidEmailError;
    }
    return null;
  }
}
