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
  final String? id;
  final String? name;
  final String? email;
  final String? department;

  EmployeeData({
    this.id,
    this.name,
    this.email,
    this.department,
  });

  factory EmployeeData.fromJson(Map<String, dynamic> json) => EmployeeData(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        department: json['department'],
      );
}
