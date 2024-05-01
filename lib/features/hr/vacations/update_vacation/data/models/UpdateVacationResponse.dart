class UpdateVacationResponse {
  UpdateVacationResponse({
      this.status, 
      this.message, 
      this.data,});

  UpdateVacationResponse.fromJson(dynamic json) {
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
      this.employee, 
      this.description, 
      this.start, 
      this.end, 
      this.status,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    employee = json['employee'];
    description = json['description'];
    start = json['start'];
    end = json['end'];
    status = json['status'];
  }
  int? id;
  String? employee;
  String? description;
  String? start;
  String? end;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['employee'] = employee;
    map['description'] = description;
    map['start'] = start;
    map['end'] = end;
    map['status'] = status;
    return map;
  }

}