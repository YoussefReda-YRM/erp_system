class UpdateEmployeeRequest {
  String? userName;
  String? email;
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
    this.gender,
    this.identificationNo,
    this.name,
    this.nationality,
    this.phoneNumber,
    this.salary,
    this.userName,
  });

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'email': email,
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
