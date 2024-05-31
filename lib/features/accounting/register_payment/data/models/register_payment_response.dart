class RegisterPaymentResponse {
  RegisterPaymentResponse({
    this.status,
    this.message,
    this.data,
  });

  RegisterPaymentResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? status;
  String? message;
  Data? data;
}

class Data {
  Data({
    this.id,
    this.amount,
    this.paymentDate,
    this.invoiceId,
    this.employee,
    this.supplier,
  });

  int? id;
  int? amount;
  String? paymentDate;
  int? invoiceId;
  String? employee;

  String? supplier;

  Data.fromJson(dynamic json) {
    id = json['id'];
    amount = json['amount'];
    paymentDate = json['paymentDate'];
    invoiceId = json['invoiceId'];
    employee = json['employee'];
    supplier = json['supplier'];
  }
}
