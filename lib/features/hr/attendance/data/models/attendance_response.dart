class AttendanceResponse {
  final int? pageIndex;
  final int? pageSize;
  final int? count;
  final List<AttendanceData>? data;

  AttendanceResponse({
    this.pageIndex,
    this.pageSize,
    this.count,
    this.data,
  });

  factory AttendanceResponse.fromJson(Map<String, dynamic> json) =>
      AttendanceResponse(
        pageIndex: json['pageIndex'],
        pageSize: json['pageSize'],
        count: json['count'],
        data: (json['data'] as List<dynamic>?)
            ?.map((productJson) =>
                AttendanceData.fromJson(productJson as Map<String, dynamic>))
            .toList(),
      );
}

class AttendanceData {
  final String? date;
  final String? checkIn;
  final String? employee;

  AttendanceData({
    this.date,
    this.checkIn,
    this.employee,
  });

  factory AttendanceData.fromJson(Map<String, dynamic> json) => AttendanceData(
        date: json['date'],
        checkIn: json['checkIn'],
        employee: json['employee'],
      );
}
