class UpdateStatusOfPermissionResponse {
  UpdateStatusOfPermissionResponse({
      this.status, 
      this.message, 
      this.data,});

  UpdateStatusOfPermissionResponse.fromJson(dynamic json) {
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
      this.date, 
      this.start, 
      this.end, 
      this.status, 
      this.description, 
      this.employee,});

  Data.fromJson(dynamic json) {
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