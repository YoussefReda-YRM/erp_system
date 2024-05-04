class AddDepartmentResponse {
  AddDepartmentResponse({
      this.status, 
      this.message, 
      this.data,});

  AddDepartmentResponse.fromJson(dynamic json) {
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
      this.departmentName, 
      this.description,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    departmentName = json['departmentName'];
    description = json['description'];
  }
  int? id;
  String? departmentName;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['departmentName'] = departmentName;
    map['description'] = description;
    return map;
  }

}