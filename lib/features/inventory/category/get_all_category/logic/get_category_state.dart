import 'package:erp_system/features/inventory/category/delete_category/data/models/response_delete_category.dart';
import 'package:erp_system/features/inventory/category/get_all_category/data/models/get_all_category_model.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  final List<CategoryAllCategoryModel> categories;

  CategorySuccess(this.categories);
}

class CategoryFailure extends CategoryState {
  final String error;

  CategoryFailure({required this.error});
}

// delte state

class DeleteCategoryInitial extends CategoryState {}

class DeleteCategoryLoading extends CategoryState {}

class DeleteCategorySuccess extends CategoryState {
  final ResponseDeleteCategory response;

  DeleteCategorySuccess(this.response);
}

class DeleteCategoryFailure extends CategoryState {
  final String error;

  DeleteCategoryFailure({required this.error});
}