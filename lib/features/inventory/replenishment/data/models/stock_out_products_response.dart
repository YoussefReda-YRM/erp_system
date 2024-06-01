class StockOutProductsResponse {
  final int? pageIndex;
  final int? pageSize;
  final int? count;
  final List<ProductData>? data;

  StockOutProductsResponse({
    this.pageIndex,
    this.pageSize,
    this.count,
    this.data,
  });

  factory StockOutProductsResponse.fromJson(Map<String, dynamic> json) =>
      StockOutProductsResponse(
        pageIndex: json['pageIndex'],
        pageSize: json['pageSize'],
        count: json['count'],
        data: (json['data'] as List<dynamic>?)
            ?.map((productJson) =>
                ProductData.fromJson(productJson as Map<String, dynamic>))
            .toList(),
      );
}

class ProductData {
  final int? id;
  final int? productId;
  final String? productName;
  final String? productBarcode;
  final int? productOnHand;
  final double? productSellPrice;

  ProductData(
      {this.id,
      this.productId,
      this.productName,
      this.productBarcode,
      this.productOnHand,
      this.productSellPrice});

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        id: json['id'],
        productId: json['productId'],
        productName: json['productName'],
        productBarcode: json['productBarcode'],
        productOnHand: json['productOnHand'],
        productSellPrice: json['productSellPrice'],
      );
}
