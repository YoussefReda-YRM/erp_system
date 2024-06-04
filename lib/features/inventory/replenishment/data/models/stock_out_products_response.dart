// class StockOutProductsResponse {
//   final List<ProductData>? data;

//   StockOutProductsResponse({
//     this.data,
//   });

//   factory StockOutProductsResponse.fromJson(Map<String, dynamic> json) =>
//       StockOutProductsResponse(
//         data: (json['data'] as List<dynamic>?)
//             ?.map((productJson) =>
//                 ProductData.fromJson(productJson as Map<String, dynamic>))
//             .toList(),
//       );
// }

class StockOutProductsResponse {
  final int? id;
  // final int? productId;
  final String? productName;
  final String? productBarcode;
  final int? productOnHand;
  final double? productSellPrice;
  final bool? isOrdered;

  StockOutProductsResponse({
    this.id,
    // this.productId,
    this.productName,
    this.productBarcode,
    this.productOnHand,
    this.productSellPrice,
    this.isOrdered,
  });

  factory StockOutProductsResponse.fromJson(Map<String, dynamic> json) => StockOutProductsResponse(
        id: json['id'],
        // productId: json['productId'],
        productName: json['productName'],
        productBarcode: json['productBarcode'],
        productOnHand: json['productOnHand'],
        productSellPrice: json['productSellPrice'],
        isOrdered: json['isOrdered'],
      );
}
