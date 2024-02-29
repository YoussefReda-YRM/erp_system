class ScmHomeModel {
  int? inventoryOrderCount;
  int? scmOrderCount;

  ScmHomeModel({
    this.inventoryOrderCount,
    this.scmOrderCount,
  });

  factory ScmHomeModel.fromJson(Map<String, dynamic> json) => ScmHomeModel(
        inventoryOrderCount: json['inventoryOrderCount'],
        scmOrderCount: json['scmOrderCount'],
      );
}
