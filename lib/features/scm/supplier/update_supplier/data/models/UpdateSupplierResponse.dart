class UpdateSupplierResponse {
  int? status;
  String? message;
  SupplierData? supplierData;

  UpdateSupplierResponse({
    this.status,
    this.message,
    this.supplierData,
  });

  factory UpdateSupplierResponse.fromJson(Map<String, dynamic> json) =>
      UpdateSupplierResponse(
        status: json['status'],
        message: json['message'],
        supplierData: json['data'] == null
            ? null
            : SupplierData.fromJson(json['data'] as Map<String, dynamic>),
      );
}

class SupplierData {
  int? id;
  String? supplierName;
  String? supplierEmail;
  String? supplierPhone;
  String? addedBy;

  SupplierData({
    this.id,
    this.supplierName,
    this.supplierEmail,
    this.supplierPhone,
    this.addedBy,

  });

  factory SupplierData.fromJson(Map<String, dynamic> json) => SupplierData(
      id: json['id'],
      supplierName: json['supplierName'],
      supplierEmail: json['supplierEmail'],
      supplierPhone: json['supplierPhone'],
      addedBy: json['addedBy']
  );

}