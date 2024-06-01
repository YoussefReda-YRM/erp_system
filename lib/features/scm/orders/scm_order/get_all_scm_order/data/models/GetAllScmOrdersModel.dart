class GetAllScmOrdersModel {
  GetAllScmOrdersModel({
      this.id, 
      this.scmOrderProducts, 
      this.reference,});

  GetAllScmOrdersModel.fromJson(dynamic json) {
    id = json['id'];
    if (json['scmOrderProducts'] != null) {
      scmOrderProducts = [];
      json['scmOrderProducts'].forEach((v) {
        scmOrderProducts?.add(ScmOrderProducts.fromJson(v));
      });
    }
    reference = json['reference'];
  }
  int? id;
  List<ScmOrderProducts>? scmOrderProducts;
  String? reference;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (scmOrderProducts != null) {
      map['scmOrderProducts'] = scmOrderProducts?.map((v) => v.toJson()).toList();
    }
    map['reference'] = reference;
    return map;
  }

}

class ScmOrderProducts {
  ScmOrderProducts({
      this.productName, 
      this.productId, 
      this.quantity,});

  ScmOrderProducts.fromJson(dynamic json) {
    productName = json['productName'];
    productId = json['productId'];
    quantity = json['quantity'];
  }
  String? productName;
  int? productId;
  int? quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productName'] = productName;
    map['productId'] = productId;
    map['quantity'] = quantity;
    return map;
  }

}