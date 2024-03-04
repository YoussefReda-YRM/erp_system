class AddEmployeeRequestBody {
  final String userName;
  final String email;
  final String password;
  final String confirmPassword;
  final String employeeJob;
  final int employeeDepartmentId;
  final String role;
  final String address;
  final String nationality;
  final String name;
  final String identificationNo;
  final String phoneNumber;
  final String bankAccount;
  final String gender;
  final String birthDate;
  final double salary;

  AddEmployeeRequestBody({
    required this.address,
    required this.nationality,
    required this.name,
    required this.identificationNo,
    required this.phoneNumber,
    required this.bankAccount,
    required this.gender,
    required this.birthDate,
    required this.salary,
    required this.userName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.employeeJob,
    required this.employeeDepartmentId,
    required this.role,
  });

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'employeeJob': employeeJob,
      'employeeDepartmentId': employeeDepartmentId,
      'role': role,
      'address': address,
      'nationality': nationality,
      'name': name,
      'identificationNo': identificationNo,
      'phoneNumber': phoneNumber,
      'bankAccount': bankAccount,
      'gender': gender,
      'birthDate': birthDate,
      'salary': salary,
    };
  }
}
