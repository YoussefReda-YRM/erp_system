class RegisterPaymentRequest {
  RegisterPaymentRequest({this.amount, this.invoiceId, this.supplierId});
  int? amount;
  int? invoiceId;
  int? supplierId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['invoiceId'] = invoiceId;
    map['amount'] = amount;
    map['supplierId'] = supplierId;

    return map;
  }
}
