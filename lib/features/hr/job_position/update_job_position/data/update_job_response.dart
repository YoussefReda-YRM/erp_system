class UpdateJobResponse {
  final int? status;
  final String? message;
  final Data? data;

  UpdateJobResponse({
    this.status,
    this.message,
    this.data,
  });

  factory UpdateJobResponse.fromJson(Map<String, dynamic> json) =>
      UpdateJobResponse(
        status: json['status'],
        message: json['message'],
        data: json['data'] != null ? Data.fromJson(json['data']) : null,
      );
}

class Data {
  Data({
    this.id,
    this.jobName,
  });

  int? id;
  String? jobName;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'],
        jobName: json['jobName'],
      );
}
