class UpdateRequestParentCategory {
  String? parentCategoryName;

  UpdateRequestParentCategory({
    this.parentCategoryName,
  });

  Map<String, dynamic> toJson() {
    return {
      'ParentCategoryName': parentCategoryName,
    };
  }
}
