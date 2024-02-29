class OrderDetailsModel {
  int? status;
  String? message;
  DataDetails? data;

  OrderDetailsModel({
    this.status,
    this.message,
    this.data,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailsModel(
        status: json['status'],
        message: json['message'],
        data: DataDetails.fromJson(json['data']),
      );
}

class DataDetails {
  final String? date;
  final String? reference;
  final int? quantity;
  final String? inventoryEmployee;
  final String? accEmployee;
  final String? product;
  final int? id;
  final int? status;

  DataDetails({
    this.date,
    this.reference,
    this.quantity,
    this.inventoryEmployee,
    this.accEmployee,
    this.product,
    this.id,
    this.status,
  });

  factory DataDetails.fromJson(Map<String, dynamic> json) => DataDetails(
        date: json['date'],
        reference: json['reference'],
        quantity: json['quantity'],
        inventoryEmployee: json['inventoryEmployee'],
        accEmployee: json['accEmployee'],
        product: json['product'],
        id: json['id'],
        status: json['status'],
      );
}
