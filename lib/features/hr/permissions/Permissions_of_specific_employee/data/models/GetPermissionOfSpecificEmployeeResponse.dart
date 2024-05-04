class GetPermissionOfSpecificEmployeeResponse {
  GetPermissionOfSpecificEmployeeResponse({
      this.id, 
      this.date, 
      this.start, 
      this.end, 
      this.status, 
      this.description, 
      this.employee,});

  GetPermissionOfSpecificEmployeeResponse.fromJson(dynamic json) {
    id = json['id'];
    date = json['date'];
    start = json['start'];
    end = json['end'];
    status = json['status'];
    description = json['description'];
    employee = json['employee'];
  }
  int? id;
  String? date;
  String? start;
  String? end;
  int? status;
  String? description;
  String? employee;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['date'] = date;
    map['start'] = start;
    map['end'] = end;
    map['status'] = status;
    map['description'] = description;
    map['employee'] = employee;
    return map;
  }

}