class CreateScmOrderRequest {
  final String reference;
  final String accEmployeeId;
  final List<Product> products;
  final int supplierId;

  CreateScmOrderRequest({
    required this.reference,
    required this.accEmployeeId,
    required this.products,
    required this.supplierId,
  });

  Map<String, dynamic> toJson() {
    return {
      'Reference': reference,
      'AccEmployeeId': accEmployeeId,
      'Products': products.map((product) => product.toJson()).toList(),
      'supplierId': supplierId,
    };
  }
}

class Product {
  final int productId;
  final int quantity;

  Product({
    required this.productId,
    required this.quantity,
  });

  Map<String, dynamic> toJson() {
    return {
      'ProductId': productId,
      'Quantity': quantity,
    };
  }
}
