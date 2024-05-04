class AddPermissionResponse {
  final int? status;
  final String? message;
  final PermissionData? data;

  AddPermissionResponse({
    this.status,
    this.message,
    this.data,
  });

  factory AddPermissionResponse.fromJson(Map<String, dynamic> json) =>
      AddPermissionResponse(
        status: json['status'],
        message: json['message'],
        data:
            json['data'] != null ? PermissionData.fromJson(json['data']) : null,
      );
}

class PermissionData {
  int? id;
  String? date;
  String? start;
  String? end;
  int? status;
  String? description;
  String? employee;

  PermissionData({
    this.id,
    this.date,
    this.start,
    this.end,
    this.status,
    this.description,
    this.employee,
  });

  factory PermissionData.fromJson(Map<String, dynamic> json) => PermissionData(
        id: json['id'],
        date: json['date'],
        start: json['start'],
        end: json['end'],
        status: json['status'],
        description: json['description'],
        employee: json['employee'],
      );
}
