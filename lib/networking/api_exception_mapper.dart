import 'package:nhg_layout/constants/constants.dart';

import '../networking/api_exception.dart';

abstract class ApiExceptionMapper {
  static const connectionError = AppStrings.noInternetConnection;
  static const clientError = AppStrings.resourceNotFound;
  static const unauthenticatedError = AppStrings.unauthenticated;
  static const serverError = AppStrings.internalServerError;
  static const unknownError = AppStrings.unknownError;
  static const emptyResultError = AppStrings.emptyResultError;

  static String? toErrorMessage(Object error) {
    if (error is ApiException) {
      if (error is ConnectionException) {
        return connectionError;
      } else if (error is ClientErrorException) {
        return clientError;
      } else if (error is UnauthenticatedException) {
        return unauthenticatedError;
      } else if (error is ServerErrorException) {
        return serverError;
      } else if (error is EmptyResultException) {
        return emptyResultError;
      } else {
        return unknownError;
        // return null;
      }
    } else {
      return unknownError;
      // return null;
    }
  }
}
