class UpdateRequestSubCategory {
  String? subCategoryName;
  int? parentCategoryId;

  UpdateRequestSubCategory({
    this.subCategoryName,
    this.parentCategoryId,
  });

  Map<String, dynamic> toJson() {
    return {
      'SubCategoryName': subCategoryName,
      'ParentCategoryId': parentCategoryId,
    };
  }
}
