class ReorderRequest {
  final int productId;
  final String accEmployeeId;
  final int quantity;
  final String reference;
  final int supplierId;

  ReorderRequest({
    required this.productId,
    required this.accEmployeeId,
    required this.quantity,
    required this.reference,
    required this.supplierId,
  });

  Map<String, dynamic> toJson() {
    return {
      'ProductId': productId,
      'AccEmployeeId': accEmployeeId,
      'Quantity': quantity,
      'Reference': reference,
      'supplierId': supplierId,
    };
  }
}
