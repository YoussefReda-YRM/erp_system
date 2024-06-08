class DetailsProductModel {
  String? productBarcode;
  double? productSellPrice;
  double? productCostPrice;
  String? employeeName;
  int? activeOrder;
  int? id;
  String? productName;
  int? productOnHand;
  String? category;
  int? productMinquantity;
  int? subCategoryId;

  DetailsProductModel({
    this.id,
    this.productName,
    this.productOnHand,
    this.productBarcode,
    this.productSellPrice,
    this.productCostPrice,
    this.employeeName,
    this.activeOrder,
    this.category,
    this.productMinquantity,
    this.subCategoryId,
  });
  factory DetailsProductModel.fromJson(Map<String, dynamic> json) =>
      DetailsProductModel(
          id: json['id'],
          productName: json['productName'],
          productOnHand: json['productOnHand'],
          productBarcode: json['productBarcode'],
          productSellPrice: json['productSellPrice'],
          productCostPrice: json['productCostPrice'],
          activeOrder: json['activeOrder'],
          employeeName: json['employee'],
          category: json['category'],
          subCategoryId: json['subCategoryId'],
          productMinquantity: json['productMinquantity']);
}
