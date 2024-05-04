class UpdateEmployeeRequest {
  String? userName;
  String? email;
  String? password;
  String? confirmPassword;
  String? employeeJob;
  int? employeeDepartmentId;
  String? role;
  String? address;
  String? nationality;
  String? name;
  String? identificationNo;
  String? phoneNumber;
  String? bankAccount;
  String? gender;
  String? birthDate;
  double? salary;

  UpdateEmployeeRequest({
    this.address,
    this.bankAccount,
    this.birthDate,
    this.confirmPassword,
    this.email,
    this.employeeDepartmentId,
    this.employeeJob,
    this.gender,
    this.identificationNo,
    this.name,
    this.nationality,
    this.password,
    this.phoneNumber,
    this.role,
    this.salary,
    this.userName,
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
