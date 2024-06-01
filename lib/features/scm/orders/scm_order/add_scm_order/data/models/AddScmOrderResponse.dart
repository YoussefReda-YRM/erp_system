class AddScmOrderResponse {
  AddScmOrderResponse({
      this.status, 
      this.message, 
      this.data,});

  AddScmOrderResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? status;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.reference, 
      this.accEmployeeId, 
      this.products,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    reference = json['reference'];
    accEmployeeId = json['accEmployeeId'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
  }
  int? id;
  String? reference;
  String? accEmployeeId;
  List<Products>? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['reference'] = reference;
    map['accEmployeeId'] = accEmployeeId;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Products {
  Products({
      this.quantity, 
      this.productId,});

  Products.fromJson(dynamic json) {
    quantity = json['quantity'];
    productId = json['productId'];
  }
  int? quantity;
  int? productId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['quantity'] = quantity;
    map['productId'] = productId;
    return map;
  }

}