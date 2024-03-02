class GetAllInventoryOrderModel {
  final int? pageIndex;
  final int? pageSize;
  final int? count;
  final List<InventoryOrderData>? data;

  GetAllInventoryOrderModel({
    this.pageIndex,
    this.pageSize,
    this.count,
    this.data,
  });

  factory GetAllInventoryOrderModel.fromJson(Map<String, dynamic> json) =>
      GetAllInventoryOrderModel(
        pageIndex: json['pageIndex'],
        pageSize: json['pageSize'],
        count: json['count'],
        data: (json['data'] as List<dynamic>?)
            ?.map((productJson) => InventoryOrderData.fromJson(
                productJson as Map<String, dynamic>))
            .toList(),
      );
}

class InventoryOrderData {
  final int? id;
  final int? status;

  InventoryOrderData({
    this.id,
    this.status,
  });

  factory InventoryOrderData.fromJson(Map<String, dynamic> json) =>
      InventoryOrderData(
        id: json['id'],
        status: json['status'],
      );
}
