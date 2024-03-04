class AddEmployeeResponse {
  int? status;
  String? message;
  UserData? userData;

  AddEmployeeResponse({
    this.status,
    this.message,
    this.userData,
  });

  factory AddEmployeeResponse.fromJson(Map<String, dynamic> json) =>
      AddEmployeeResponse(
        status: json['status'] as int?,
        message: json['message'] as String?,
        userData: json['user'] == null
            ? null
            : UserData.fromJson(json['user'] as Map<String, dynamic>),
      );
}

class UserData {
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

  UserData({
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

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        userID: json['userID'],
        address: json['address'],
        nationality: json['nationality'],
        name: json['name'],
        identificationNo: json['identificationNo'],
        phoneNumber: json['phoneNumber'],
        bankAccount: json['bankAccount'],
        gender: json['gender'],
        birthDate: json['birthDate'],
        salary: json['salary'],
        userName: json['username'],
        email: json['email'],
        employeeDepartment: json['employeeDepartment'],
        role: json['role'],
      );
}
