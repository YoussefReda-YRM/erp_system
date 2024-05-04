class GetAllEmployeeResponse {
  final int? pageIndex;
  final int? pageSize;
  final int? count;
  final List<EmployeeData>? data;

  GetAllEmployeeResponse({
    this.pageIndex,
    this.pageSize,
    this.count,
    this.data,
  });

  factory GetAllEmployeeResponse.fromJson(Map<String, dynamic> json) =>
      GetAllEmployeeResponse(
        pageIndex: json['pageIndex'],
        pageSize: json['pageSize'],
        count: json['count'],
        data: (json['data'] as List<dynamic>?)
            ?.map((productJson) =>
                EmployeeData.fromJson(productJson as Map<String, dynamic>))
            .toList(),
      );
}

class EmployeeData {
  final String? userId;
  final String? name;
  final String? email;
  final String? userName;
  final String? role;
  final String? employeeDepartment;
  final String? address;
  final String? phoneNumber;
  final String? nationality;
  final String? identificationNo;
  final String? bankAccount;
  final String? gender;
  final String? birthDate;
  final double? salary;

  EmployeeData({
    this.userId,
    this.name,
    this.email,
    this.userName,
    this.role,
    this.employeeDepartment,
    this.address,
    this.phoneNumber,
    this.nationality,
    this.identificationNo,
    this.bankAccount,
    this.gender,
    this.birthDate,
    this.salary,
  });

  factory EmployeeData.fromJson(Map<String, dynamic> json) => EmployeeData(
        userId: json['userID'],
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
