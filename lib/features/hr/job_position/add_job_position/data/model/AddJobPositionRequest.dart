class AddJobPositionRequest {
  AddJobPositionRequest({
      this.jobName, 
      this.departmentId,});

  AddJobPositionRequest.fromJson(dynamic json) {
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