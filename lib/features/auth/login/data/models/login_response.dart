class LoginResponse {
  String? token;
  String? expiresOn;
  bool? isAuthenticated;
  UserData? userData;
  int? status;
  String? message;

  LoginResponse({
    this.token,
    this.expiresOn,
    this.isAuthenticated,
    this.status,
    this.userData,
    this.message,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        token: json['token'],
        expiresOn: json['expiresOn'],
        isAuthenticated: json['isAuthenticated'],
        userData: json['user'] == null ? null : UserData.fromJson(json['user']),
        status: json['status'],
        message: json['message'],
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
    this.email,
    this.userName,
    this.role,
    this.address,
    this.bankAccount,
    this.birthDate,
    this.employeeDepartment,
    this.gender,
    this.identificationNo,
    this.name,
    this.nationality,
    this.phoneNumber,
    this.salary,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        userID: json['userID'],
        name: json['name'],
        email: json['email'],
        userName: json['username'],
        role: json['role'],
        employeeDepartment: json['employeeDepartment'],
        address: json['address'],
        phoneNumber: json['phoneNumber'],
        nationality: json['nationality'],
        identificationNo: json['identificationNo'],
        bankAccount: json['bankAccount'],
        gender: json['gender'],
        birthDate: json['birthDate'],
        salary: json['salary'],
      );
}
