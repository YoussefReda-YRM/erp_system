class ForgotPasswordRequestBody {
  final String phone;

  ForgotPasswordRequestBody({
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
    };
  }
}
