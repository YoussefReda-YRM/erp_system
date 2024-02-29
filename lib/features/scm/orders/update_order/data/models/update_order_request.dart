class UpdateOrderRequest {
  String? accEmployeeId;
  String? quantity;
  String? reference;

  UpdateOrderRequest({
    this.accEmployeeId,
    this.quantity,
    this.reference,
  });

  Map<String, dynamic> toJson() {
    return {
      'accEmployeeId': accEmployeeId,
      'Quantity': quantity,
      'Reference': reference,
    };
  }
}
