class AddRequestParentCategory {
  String? parentCategoryName;

  AddRequestParentCategory({
    this.parentCategoryName,
  });

  Map<String, dynamic> toJson() {
    return {
      'ParentCategoryName': parentCategoryName,
    };
  }
}
