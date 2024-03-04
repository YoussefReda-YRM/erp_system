// class UpdateOrderResponse {
//   UpdateOrderResponse({
//     this.status,
//     this.message,
//     this.data,
//   });

//   UpdateOrderResponse.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//   }
//   int? status;
//   String? message;
//   Data? data;
// }

// class Data {
//   Data({
//     this.orderId,
//     this.accEmployeeId,
//     this.inventoryEmployeeId,
//     this.productId,
//     this.quantity,
//     this.reference,
//   });
//   int? orderId;
//   String? accEmployeeId;
//   String? inventoryEmployeeId;
//   int? productId;
//   int? quantity;
//   String? reference;

//   Data.fromJson(Map<String, dynamic> json) {
//     orderId = json['id'];
//     accEmployeeId = json['accEmployeeId'];
//     inventoryEmployeeId = json['inventoryEmployeeId'];
//     productId = json['productId'];
//     quantity = json['quantity'];
//     reference = json['reference'];
//   }
// }
