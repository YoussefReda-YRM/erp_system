class UpdateEmployeeRequest {
  String? userName;
  String? email;
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
    this.email,
    this.employeeDepartmentId,
    this.employeeJob,
    this.gender,
    this.identificationNo,
    this.name,
    this.nationality,
    this.phoneNumber,
    this.role,
    this.salary,
    this.userName,
  });

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'email': email,
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
