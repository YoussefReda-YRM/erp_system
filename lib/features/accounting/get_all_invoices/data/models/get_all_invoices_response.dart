class GetAllInvoicesResponse {
  final int? id;
  final String? billDate;
  final String? dueDate;
  final String? invoiceNumber;
  final double? subTotal;
  final double? taxTotal;
  final double? paid;
  final double? toPay;
  final List<Payments>? payment;
  final String? employee;
  final String? supplier;
  final int? inventoryOrderId;
  final int? scmOrderId;
  final String? tax;

  GetAllInvoicesResponse({
    this.id,
    this.billDate,
    this.dueDate,
    this.invoiceNumber,
    this.subTotal,
    this.taxTotal,
    this.paid,
    this.toPay,
    this.payment,
    this.employee,
    this.supplier,
    this.inventoryOrderId,
    this.scmOrderId,
    this.tax,
  });

  factory GetAllInvoicesResponse.fromJson(
          Map<String, dynamic> json) =>
      GetAllInvoicesResponse(
        id: json['id'],
        billDate: json['billDate'],
        dueDate: json['dueDate'],
        invoiceNumber: json['invoiceNumber'],
        subTotal: json['subTotal'],
        taxTotal: json['taxTotal'],
        paid: json['paid'],
        toPay: json['toPay'],
        payment: (json['payment'] as List<dynamic>?)
            ?.map(
                (payment) => Payments.fromJson(payment as Map<String, dynamic>))
            .toList(),
        employee: json['employee'],
        supplier: json['supplier'],
        inventoryOrderId: json['inventoryOrderId'],
        scmOrderId: json['scmOrderId'],
        tax: json['tax'],
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
