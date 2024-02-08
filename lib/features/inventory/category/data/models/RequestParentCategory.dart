class RequestParentCategory {
  RequestParentCategory({
      this.parentCategoryName,});

  RequestParentCategory.fromJson(dynamic json) {
    parentCategoryName = json['ParentCategoryName'];
  }
  String? parentCategoryName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ParentCategoryName'] = parentCategoryName;
    return map;
  }

}