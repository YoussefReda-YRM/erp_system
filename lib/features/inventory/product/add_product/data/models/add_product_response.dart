class AddProductResponse {
  int? status;
  String? message;
  ProductData? productData;

  AddProductResponse({
    this.status,
    this.message,
    this.productData,
  });

  factory AddProductResponse.fromJson(Map<String, dynamic> json) =>
      AddProductResponse(
        status: json['status'],
        message: json['message'],
        productData: json['data'] == null
            ? null
            : ProductData.fromJson(json['data'] as Map<String, dynamic>),
      );
}

class ProductData {
  int? id;
  String? productName;
  int? productOnHand;
  String? productBarcode;
  int? productInComing;
  int? productOutGoing;
  int? productSellPrice;
  int? productCostPrice;
  int? activeOrder;
  String? addedBy;
  int? subCategoryId;

  ProductData({
    this.id,
    this.productName,
    this.productOnHand,
    this.productBarcode,
    this.productInComing,
    this.productOutGoing,
    this.productSellPrice,
    this.productCostPrice,
    this.activeOrder,
    this.addedBy,
    this.subCategoryId,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        id: json['id'],
        productName: json['productName'],
        productOnHand: json['productOnHand'],
        productBarcode: json['productBarcode'],
        productInComing: json['productInComing'],
        productOutGoing: json['productOutGoing'],
        productSellPrice: json['productSellPrice'],
        productCostPrice: json['productCostPrice'],
        activeOrder: json['activeOrder'],
        addedBy: json['addedBy'],
        subCategoryId: json['subCategoryId'],
      );
}
