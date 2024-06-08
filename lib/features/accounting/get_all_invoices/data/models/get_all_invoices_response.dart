class GetAllInvoicesResponse {
  final int? id;
  final String? billDate;
  final String? dueDate;
  final String? invoiceNumber;
  final double? subTotal;
  final double? paid;
  final double? toPay;
  final List<Payments>? payment;
  final String? supplier;
  final int? supplierId;
  final int? inventoryOrderId;
  final int? scmOrderId;

  GetAllInvoicesResponse({
    this.id,
    this.billDate,
    this.dueDate,
    this.invoiceNumber,
    this.subTotal,
    this.paid,
    this.toPay,
    this.payment,
    this.supplier,
    this.inventoryOrderId,
    this.scmOrderId,
    this.supplierId,
  });

  factory GetAllInvoicesResponse.fromJson(Map<String, dynamic> json) =>
      GetAllInvoicesResponse(
        id: json['id'],
        billDate: json['billDate'],
        dueDate: json['dueDate'],
        invoiceNumber: json['invoiceNumber'],
        subTotal: json['subTotal'],
        paid: json['paid'],
        toPay: json['toPay'],
        payment: (json['payment'] as List<dynamic>?)
            ?.map(
                (payment) => Payments.fromJson(payment as Map<String, dynamic>))
            .toList(),
        supplier: json['supplier'],
        inventoryOrderId: json['inventoryOrderId'],
        scmOrderId: json['scmOrderId'],
        supplierId: json['supplierId'],
      );
}

class Payments {
  final int? id;
  final double? amount;
  final String? paymentDate;

  Payments({
    this.id,
    this.amount,
    this.paymentDate,
  });

  factory Payments.fromJson(Map<String, dynamic> json) => Payments(
        id: json['id'],
        amount: json['amount'],
        paymentDate: json['paymentDate'],
      );
}
