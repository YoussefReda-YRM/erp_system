class UpdateJobResponse {
  UpdateJobResponse({
      this.status, 
      this.message, 
      this.data,});

  UpdateJobResponse.fromJson(dynamic json) {
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
      this.id, 
      this.jobName,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    jobName = json['jobName'];
  }
  int? id;
  String? jobName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['jobName'] = jobName;
    return map;
  }

}