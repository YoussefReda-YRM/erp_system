class SignupRequestBody {
  final String userName;
  final String email;
  final String password;
  final String confirmPassword;
  final String employeeJop;
  final String addedById;
  final String employeeDepartmentId;
  final String role;

  SignupRequestBody({
    required this.userName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.employeeJop,
    required this.addedById,
    required this.employeeDepartmentId,
    required this.role,
  });

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'employeeJob': employeeJop,
      'addedById': addedById,
      'employeeDepartmentId': employeeDepartmentId,
      'role': role,
    };
  }
}
