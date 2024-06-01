class AddScmOrderModel {
  AddScmOrderModel({
      this.reference, 
      this.accEmployeeId, 
      this.products,});

  AddScmOrderModel.fromJson(dynamic json) {
    reference = json['Reference'];
    accEmployeeId = json['AccEmployeeId'];
    if (json['Products'] != null) {
      products = [];
      json['Products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
  }
  String? reference;
  String? accEmployeeId;
  List<Products>? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Reference'] = reference;
    map['AccEmployeeId'] = accEmployeeId;
    if (products != null) {
      map['Products'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Products {
  Products({
      this.productId, 
      this.quantity,});

  Products.fromJson(dynamic json) {
    productId = json['ProductId'];
    quantity = json['Quantity'];
  }
  int? productId;
  int? quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ProductId'] = productId;
    map['Quantity'] = quantity;
    return map;
  }

}