class UpdateOrderRequest {
  String? accEmployeeId;
  int? quantity;
  String? reference;
  int? supplierId;

  UpdateOrderRequest(
      {this.accEmployeeId, this.quantity, this.reference, this.supplierId});

  Map<String, dynamic> toJson() {
    return {
      'accEmployeeId': accEmployeeId,
      'Quantity': quantity,
      'Reference': reference,
      'supplierId': supplierId
    };
  }
}
