class UpdateVacationRequest {
  UpdateVacationRequest({
      this.start, 
      this.end, 
      this.description,});

  UpdateVacationRequest.fromJson(dynamic json) {
    start = json['start'];
    end = json['end'];
    description = json['description'];
  }
  String? start;
  String? end;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['start'] = start;
    map['end'] = end;
    map['description'] = description;
    return map;
  }

}