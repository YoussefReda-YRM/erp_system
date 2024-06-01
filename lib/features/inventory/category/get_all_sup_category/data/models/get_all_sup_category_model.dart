class GetAllSupCategoryModel {
  final int subCategoryId;
  final String subCategoryName;

  GetAllSupCategoryModel({
    required this.subCategoryId,
    required this.subCategoryName,
  });

  factory GetAllSupCategoryModel.fromJson(Map<String, dynamic> json) {
    return GetAllSupCategoryModel(
      subCategoryId: json['subCategoryId'] ?? 0,
      subCategoryName: json['subCategoryName'] ?? '',
    );
  }
}
