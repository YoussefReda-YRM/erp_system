class GetAllScmOrdersResponse {
  final List<ScmOrderProducts>? scmOrderProducts;
  final String? reference;

  GetAllScmOrdersResponse({
    this.scmOrderProducts,
    this.reference,
  });

  factory GetAllScmOrdersResponse.fromJson(Map<String, dynamic> json) =>
      GetAllScmOrdersResponse(
        scmOrderProducts: (json['scmOrderProducts'] as List<dynamic>?)
            ?.map((scmOrderProduct) => ScmOrderProducts.fromJson(
                scmOrderProduct as Map<String, dynamic>))
            .toList(),
        reference: json['reference'],
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
