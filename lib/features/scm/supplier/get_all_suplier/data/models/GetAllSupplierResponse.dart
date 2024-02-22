class GetAllSupplierResponse {
  GetAllSupplierResponse({
      this.pageIndex, 
      this.pageSize, 
      this.count, 
      this.data,});

  GetAllSupplierResponse.fromJson(dynamic json) {
    pageIndex = json['pageIndex'];
    pageSize = json['pageSize'];
    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  int? pageIndex;
  int? pageSize;
  int? count;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pageIndex'] = pageIndex;
    map['pageSize'] = pageSize;
    map['count'] = count;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
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