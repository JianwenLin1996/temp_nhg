class User {
  int id;
  String userName;
  String userEmail;
  String userPhoneNumber;
  String userICNumber;
  bool userICVerification;
  User({
    this.id = 0,
    this.userName = 'Bailey',
    this.userEmail = 'bailey0109@gmail.com',
    this.userPhoneNumber = '012-1147711',
    this.userICNumber = '801228019951',
    this.userICVerification = true,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        userName: json['name'],
        userEmail: json['email'],
        userPhoneNumber: json['phone_number'],
        userICNumber: json['ic_number'],
        userICVerification: json['ic_verification'],
      );
}
