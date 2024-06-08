class UpdateProductResponse {
  int? status;
  String? message;
  ProductData? productData;

  UpdateProductResponse({
    this.status,
    this.message,
    this.productData,
  });

  factory UpdateProductResponse.fromJson(Map<String, dynamic> json) =>
      UpdateProductResponse(
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
  double? productSellPrice;
  double? productCostPrice;
  int? activeOrder;
  String? addedBy;
  int? subCategoryId;
  int? productMinquantity;

  ProductData(
      {this.id,
      this.productName,
      this.productOnHand,
      this.productBarcode,
      this.productSellPrice,
      this.productCostPrice,
      this.activeOrder,
      this.addedBy,
      this.subCategoryId,
      this.productMinquantity});

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        id: json['id'],
        productName: json['productName'],
        productOnHand: json['productOnHand'],
        productBarcode: json['productBarcode'],
        productSellPrice: json['productSellPrice'],
        productCostPrice: json['productCostPrice'],
        activeOrder: json['activeOrder'],
        addedBy: json['addedBy'],
        subCategoryId: json['subCategoryId'],
        productMinquantity: json['productMinquantity'],
      );
}
