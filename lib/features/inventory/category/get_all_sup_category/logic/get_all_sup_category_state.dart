import 'package:erp_system/features/inventory/category/get_all_sup_category/data/models/get_all_sup_category_model.dart';

abstract class GetAllSupCategoryState {}

class GetAllSupCategoryInitial extends GetAllSupCategoryState {}

class GetAllSupCategoryLoading extends GetAllSupCategoryState {}

class GetAllSupCategorySuccess extends GetAllSupCategoryState {
  final List<GetAllSupCategoryModel> categories;

  GetAllSupCategorySuccess(this.categories);
}

class GetAllSupCategoryFailure extends GetAllSupCategoryState {
  final String error;

  GetAllSupCategoryFailure({required this.error});
}
