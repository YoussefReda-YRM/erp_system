class AddTaxesResponse {
  AddTaxesResponse({
      this.status, 
      this.message, 
      this.data,});

  AddTaxesResponse.fromJson(dynamic json) {
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
      this.taxName, 
      this.taxValue, 
      this.taxType,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    taxName = json['taxName'];
    taxValue = json['taxValue'];
    taxType = json['taxType'];
  }
  int? id;
  String? taxName;
  int? taxValue;
  int? taxType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['taxName'] = taxName;
    map['taxValue'] = taxValue;
    map['taxType'] = taxType;
    return map;
  }

}