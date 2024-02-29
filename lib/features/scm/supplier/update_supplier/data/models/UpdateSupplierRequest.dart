class UpdateSupplierRequest {
  UpdateSupplierRequest({
      this.supplierName, 
      this.supplierEmail, 
      this.supplierPhone,});

  UpdateSupplierRequest.fromJson(dynamic json) {
    supplierName = json['supplierName'];
    supplierEmail = json['supplierEmail'];
    supplierPhone = json['supplierPhone'];
  }
  String? supplierName;
  String? supplierEmail;
  String? supplierPhone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['supplierName'] = supplierName;
    map['supplierEmail'] = supplierEmail;
    map['supplierPhone'] = supplierPhone;
    return map;
  }

}