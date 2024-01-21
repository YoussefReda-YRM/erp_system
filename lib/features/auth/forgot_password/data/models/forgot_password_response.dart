class ForgotPasswordResponse {
  String? message;
  UserData? userData;
  bool? status;
  int? code;

  ForgotPasswordResponse({
    this.message,
    this.userData,
    this.status,
    this.code,
  });

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) => ForgotPasswordResponse(
      message: json['message'] as String?,
      userData: json['data'] == null
          ? null
          : UserData.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as bool?,
      code: json['code'] as int?);
}

class UserData {
  String? pinNumber;
  String? userName;
  UserData({this.pinNumber, this.userName});

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        pinNumber: json['pinNumber'] as String?,
        userName: json['username'] as String?,
      );
}
