class DetailsEmployeeModel {
  String? userID;
  String? name;
  String? email;
  String? userName;
  String? role;
  String? employeeDepartment;
  String? address;
  String? phoneNumber;
  String? nationality;
  String? identificationNo;
  String? bankAccount;
  String? gender;
  String? birthDate;
  double? salary;

  DetailsEmployeeModel({
    this.userID,
    this.address,
    this.nationality,
    this.name,
    this.identificationNo,
    this.phoneNumber,
    this.bankAccount,
    this.gender,
    this.birthDate,
    this.salary,
    this.userName,
    this.email,
    this.employeeDepartment,
    this.role,
  });

  factory DetailsEmployeeModel.fromJson(Map<String, dynamic> json) =>
      DetailsEmployeeModel(
        userID: json['userID'] as String,
        address: json['address'] as String,
        nationality: json['nationality'] as String,
        name: json['name'] as String,
        identificationNo: json['identificationNo'] as String,
        phoneNumber: json['phoneNumber'] as String,
        bankAccount: json['bankAccount'] as String,
        gender: json['gender'] as String,
        birthDate: json['birthDate'] as String,
        salary: json['salary'] as double,
        userName: json['username'] as String,
        email: json['email'] as String,
        employeeDepartment: json['employeeDepartment'] as String,
        role: json['role'] as String,
      );
}
