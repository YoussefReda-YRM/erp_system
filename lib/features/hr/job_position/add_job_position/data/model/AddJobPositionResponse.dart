class AddJobPositionResponse {
  AddJobPositionResponse({
      this.status, 
      this.message, 
      this.data,});

  AddJobPositionResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? status;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.jobName, 
      this.departmentId,});

  Data.fromJson(dynamic json) {
    jobName = json['jobName'];
    departmentId = json['departmentId'];
  }
  String? jobName;
  int? departmentId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['jobName'] = jobName;
    map['departmentId'] = departmentId;
    return map;
  }

}