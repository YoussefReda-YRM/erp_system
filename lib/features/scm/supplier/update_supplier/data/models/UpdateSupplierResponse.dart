class UpdateSupplierResponse {
  UpdateSupplierResponse({
      this.status, 
      this.message, 
      this.data,});

  UpdateSupplierResponse.fromJson(dynamic json) {
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
      this.supplierName, 
      this.supplierEmail, 
      this.supplierPhone, 
      this.addedBy,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    supplierName = json['supplierName'];
    supplierEmail = json['supplierEmail'];
    supplierPhone = json['supplierPhone'];
    addedBy = json['addedBy'];
  }
  int? id;
  String? supplierName;
  String? supplierEmail;
  String? supplierPhone;
  String? addedBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['supplierName'] = supplierName;
    map['supplierEmail'] = supplierEmail;
    map['supplierPhone'] = supplierPhone;
    map['addedBy'] = addedBy;
    return map;
  }

}