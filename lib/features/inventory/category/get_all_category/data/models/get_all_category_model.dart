import 'package:erp_system/features/inventory/category/get_all_sup_category/data/models/get_all_sup_category_model.dart';

class CategoryAllCategoryModel {
  int? parentCategoryId;
  String? parentCategoryName;
  List<GetAllSupCategoryModel>? subCategories;

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
        subCategories?.add(GetAllSupCategoryModel.fromJson(v));
      });
    }
  }
}