class AddSupplierRequest {
  AddSupplierRequest({
    this.supplierName,
    this.supplierEmail,
    this.supplierPhone,});

  String? supplierName;
  String? supplierEmail;
  String? supplierPhone;



  Map<String, dynamic> toJson() {
    return {
      'supplierName': supplierName,
      'supplierEmail': supplierEmail,
      'supplierPhone': supplierPhone,
    };
  }
}