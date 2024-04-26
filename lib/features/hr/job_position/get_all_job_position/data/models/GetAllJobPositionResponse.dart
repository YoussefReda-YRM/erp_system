class GetAllJobPositionResponse {
  GetAllJobPositionResponse({
      this.id, 
      this.jobName,});

  GetAllJobPositionResponse.fromJson(dynamic json) {
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