class LoginResponse {
  String? token;
  String? expiresOn;
  UserData? userData;
  String? message;
  bool? isAuthenticated;

  LoginResponse({
    this.token,
    this.expiresOn,
    this.userData,
    this.message,
    this.isAuthenticated,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
      token: json['token'] as String?,
      expiresOn: json['expiresOn'],
      userData: json['user'] == null
          ? null
          : UserData.fromJson(json['user'] as Map<String, dynamic>),
      message: json['message'] as String?,
      isAuthenticated: json['isAuthenticated'] as bool?);
}

class UserData {
  String? userID;
  String? email;
  String? userName;
  List? roles;
  UserData({this.userID, this.email, this.userName, this.roles});

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
      userID: json['userID'] as String?,
      email: json['email'] as String?,
      userName: json['username'] as String?,
      roles: json['roles'] as List?);
}
