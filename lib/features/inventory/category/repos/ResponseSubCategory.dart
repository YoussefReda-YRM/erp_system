class ResponseSubCategory {
  int? status;
  String? message;
  Data? data;
  
  ResponseSubCategory({
    this.status,
    this.message,
    this.data,
  });

  ResponseSubCategory.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    this.id,
    this.subCategoryName,
    this.parentCategoryId,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    subCategoryName = json['subCategoryName'];
    parentCategoryId = json['parentCategoryId'];
  }
  int? id;
  String? subCategoryName;
  int? parentCategoryId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['subCategoryName'] = subCategoryName;
    map['parentCategoryId'] = parentCategoryId;
    return map;
  }
}
