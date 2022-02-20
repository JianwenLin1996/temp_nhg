class RouteList {
  RouteList._();
  //prevent class from being instantiated as this private constructor overrider default constructor
  //usually used when the class has only static variables

  static const initialScreen = '/';
  static const homeScreen = '/home';
  static const loginScreen = '/login';
  static const resetPasswordScreen = '/forgot_password';
  static const errorScreen = '/error';
}
