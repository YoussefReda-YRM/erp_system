class DetailsProductModel {
  
  String? productBarcode;
  int? productInComing;
  int? productOutGoing;
  double? productSellPrice;
  double? productCostPrice;
  String? employeeName;
  int? activeOrder;
  int? id;
  String? productName;
  int? productOnHand;
  String? category;

  DetailsProductModel({
    this.id,
    this.productName,
    this.productOnHand,
    this.productBarcode,
    this.productInComing,
    this.productOutGoing,
    this.productSellPrice,
    this.productCostPrice,
    this.employeeName,
    this.activeOrder,
    this.category,
  });
  factory DetailsProductModel.fromJson(Map<String, dynamic> json) =>
      DetailsProductModel(
        id: json['id'],
        productName: json['productName'],
        productOnHand: json['productOnHand'],
        productBarcode: json['productBarcode'],
        productInComing: json['productInComing'],
        productOutGoing: json['productOutGoing'],
        productSellPrice: json['productSellPrice'],
        productCostPrice: json['productCostPrice'],
        activeOrder: json['activeOrder'],
        employeeName: json['employee'],
        category: json['category'],
      );
}
