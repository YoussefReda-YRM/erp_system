class UpdateProductRequestBody {
  final String productName;
  final int productOnHand;
  final String productBarcode;
  final double productSellPrice;
  final double productCostPrice;
  final int activeOrder;
  final String addedBy;
  final int subCategoryId;
  final int productMinquantity;

  UpdateProductRequestBody({
    required this.productName,
    required this.productOnHand,
    required this.productBarcode,
    required this.productSellPrice,
    required this.productCostPrice,
    required this.activeOrder,
    required this.addedBy,
    required this.subCategoryId,
    required this.productMinquantity,
  });

  Map<String, dynamic> toJson() {
    return {
      'productName': productName,
      'productOnHand': productOnHand,
      'productBarcode': productBarcode,
      'productSellPrice': productSellPrice,
      'productCostPrice': productCostPrice,
      'activeOrder': activeOrder,
      'addedBy': addedBy,
      'subCategoryId': subCategoryId,
      'productMinquantity': productMinquantity,
    };
  }
}
