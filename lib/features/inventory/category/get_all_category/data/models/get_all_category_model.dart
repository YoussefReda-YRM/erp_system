class CategoryAllCategoryModel {
  int? parentCategoryId;
  String? parentCategoryName;
  List<SubCategories>? subCategories;

  CategoryAllCategoryModel({
    this.parentCategoryId,
    this.parentCategoryName,
    this.subCategories,
  });

  CategoryAllCategoryModel.fromJson(dynamic json) {
    parentCategoryId = json['parentCategoryId'];
    parentCategoryName = json['parentCategoryName'];
    if (json['subCategories'] != null) {
      subCategories = [];
      json['subCategories'].forEach((v) {
        subCategories?.add(SubCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['parentCategoryId'] = parentCategoryId;
    map['parentCategoryName'] = parentCategoryName;
    if (subCategories != null) {
      map['subCategories'] = subCategories?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class SubCategories {
  SubCategories({
    this.subCategoryId,
    this.subCategoryName,
  });

  SubCategories.fromJson(dynamic json) {
    subCategoryId = json['subCategoryId'];
    subCategoryName = json['subCategoryName'];
  }
  int? subCategoryId;
  String? subCategoryName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['subCategoryId'] = subCategoryId;
    map['subCategoryName'] = subCategoryName;
    return map;
  }
}
