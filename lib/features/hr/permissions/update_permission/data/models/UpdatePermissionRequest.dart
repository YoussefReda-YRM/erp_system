class UpdatePermissionRequest {
  UpdatePermissionRequest({
      this.start, 
      this.end, 
      this.date, 
      this.description,});

  UpdatePermissionRequest.fromJson(dynamic json) {
    start = json['start'];
    end = json['end'];
    date = json['date'];
    description = json['description'];
  }
  String? start;
  String? end;
  String? date;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['start'] = start;
    map['end'] = end;
    map['date'] = date;
    map['description'] = description;
    return map;
  }

}