class AddRequestSubCategoey {
  AddRequestSubCategoey({
    this.subCategoryName,
    this.parentCategoryId,
  });

  AddRequestSubCategoey.fromJson(dynamic json) {
    subCategoryName = json['subCategoryName'];
    parentCategoryId = json['parentCategoryId'];
  }
  String? subCategoryName;
  int? parentCategoryId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['subCategoryName'] = subCategoryName;
    map['parentCategoryId'] = parentCategoryId;
    return map;
  }
}
