class UpdateProductRequestBody {
  final String productName;
  final int productOnHand;
  final String productBarcode;
  final int productInComing;
  final int productOutGoing;
  final int productSellPrice;
  final int productCostPrice;
  final int activeOrder;
  final String addedBy;
  final int subCategoryId;
  final int productMinquantity;

  UpdateProductRequestBody({
    required this.productName,
    required this.productOnHand,
    required this.productBarcode,
    required this.productInComing,
    required this.productOutGoing,
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
      'productInComing': productInComing,
      'productOutGoing': productOutGoing,
      'productSellPrice': productSellPrice,
      'productCostPrice': productCostPrice,
      'activeOrder': activeOrder,
      'addedBy': addedBy,
      'subCategoryId': subCategoryId,
      'productMinquantity': productMinquantity,
    };
  }
}
