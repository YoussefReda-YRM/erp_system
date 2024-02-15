class GetAllProductResponse {
  final int? pageIndex;
  final int? pageSize;
  final int? count;
  final List<ProductData>? data;

  GetAllProductResponse({
    this.pageIndex,
    this.pageSize,
    this.count,
    this.data,
  });

  factory GetAllProductResponse.fromJson(Map<String, dynamic> json) =>
      GetAllProductResponse(
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
  final int? productId;
  final String? productName;
  final int? productOnHand;
  final String? category;

  ProductData({
    this.productId,
    this.productName,
    this.productOnHand,
    this.category,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        productId: json['id'],
        productName: json['productName'],
        productOnHand: json['productOnHand'],
        category: json['category'],
      );
}
