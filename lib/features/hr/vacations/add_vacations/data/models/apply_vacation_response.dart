class ApplyVacationResponse {
  int? status;
  String? message;
  VacationData? vacationData;

  ApplyVacationResponse({
    this.status,
    this.message,
    this.vacationData,
  });

  factory ApplyVacationResponse.fromJson(Map<String, dynamic> json) =>
      ApplyVacationResponse(
        status: json['status'] as int?,
        message: json['message'] as String?,
        vacationData: json['data'] == null
            ? null
            : VacationData.fromJson(json['data'] as Map<String, dynamic>),
      );
}

class VacationData {
  int? id;
  String? employee;
  String? description;
  String? start;
  String? end;
  int? status;

  VacationData({
    this.id,
    this.employee,
    this.description,
    this.start,
    this.end,
    this.status,
  });

  factory VacationData.fromJson(Map<String, dynamic> json) => VacationData(
        id: json['id'],
        employee: json['employee'],
        description: json['description'],
        start: json['start'],
        end: json['end'],
        status: json['status'],
      );
}
