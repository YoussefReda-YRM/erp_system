class InventoryHomeModel {
  int? productsCount;
  int? replenishmentCount;

  InventoryHomeModel({
    this.productsCount,
    this.replenishmentCount,
  });

  factory InventoryHomeModel.fromJson(Map<String, dynamic> json) =>
      InventoryHomeModel(
        productsCount: json['productsCount'],
        replenishmentCount: json['replenishmentCount'],
      );
}
