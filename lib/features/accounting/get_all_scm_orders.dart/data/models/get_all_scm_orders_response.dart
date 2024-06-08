class GetAllScmOrdersResponse {
  final List<ScmOrderProducts>? scmOrderProducts;
  final String? reference;
  final int? id;
  final int? status;
  final double? totalCostPrice;

  GetAllScmOrdersResponse({
    this.scmOrderProducts,
    this.reference,
    this.id,
    this.status,
    this.totalCostPrice,
  });

  factory GetAllScmOrdersResponse.fromJson(Map<String, dynamic> json) =>
      GetAllScmOrdersResponse(
        scmOrderProducts: (json['scmOrderProducts'] as List<dynamic>?)
            ?.map((scmOrderProduct) => ScmOrderProducts.fromJson(
                scmOrderProduct as Map<String, dynamic>))
            .toList(),
        reference: json['reference'],
        id: json['id'],
        status: json['status'],
        totalCostPrice: json['totalCostPrice'],
      );
}

class ScmOrderProducts {
  final String? productName;
  final int? productId;
  final int? quantity;

  ScmOrderProducts({this.productName, this.productId, this.quantity});

  factory ScmOrderProducts.fromJson(Map<String, dynamic> json) =>
      ScmOrderProducts(
        productName: json['productName'],
        productId: json['productId'],
        quantity: json['quantity'],
      );
}
