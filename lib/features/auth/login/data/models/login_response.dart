class LoginResponse {
  String? message;
  UserData? userData;
  bool? status;
  int? code;

  LoginResponse({
    this.message,
    this.userData,
    this.status,
    this.code,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
      message: json['message'] as String?,
      userData: json['data'] == null
          ? null
          : UserData.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as bool?,
      code: json['code'] as int?);
}

class UserData {
  String? token;
  String? userName;
  UserData({this.token, this.userName});

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        token: json['token'] as String?,
        userName: json['username'] as String?,
      );
}
