class SignupResponse {
  String? message;
  bool? isAuthenticated;

  SignupResponse({
    this.message,
    this.isAuthenticated,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) => SignupResponse(
        message: json['message'] as String?,
        isAuthenticated: json['isAuthenticated'] as bool?,
      );
}
