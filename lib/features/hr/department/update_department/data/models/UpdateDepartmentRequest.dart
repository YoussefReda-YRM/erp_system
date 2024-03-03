class UpdateDepartmentRequest {
  UpdateDepartmentRequest({
      this.departmentName, 
      this.description,});

  UpdateDepartmentRequest.fromJson(dynamic json) {
    departmentName = json['DepartmentName'];
    description = json['Description'];
  }
  String? departmentName;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['DepartmentName'] = departmentName;
    map['Description'] = description;
    return map;
  }

}