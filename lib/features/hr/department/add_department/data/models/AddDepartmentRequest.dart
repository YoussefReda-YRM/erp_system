class AddDepartmentRequest {
  AddDepartmentRequest({
      this.departmentName, 
      this.description,});

  AddDepartmentRequest.fromJson(dynamic json) {
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