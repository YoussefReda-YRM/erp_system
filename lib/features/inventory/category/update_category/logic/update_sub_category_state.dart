import 'package:erp_system/features/inventory/category/repos/ResponseSubCategory.dart';

abstract class UpdateSubCategoryState {}

class UpdateSubCategoryInitial extends UpdateSubCategoryState {}

class UpdateSubCategoryLoading extends UpdateSubCategoryState {}

class UpdateSubCategorySuccess extends UpdateSubCategoryState {
  final ResponseSubCategory response;

  UpdateSubCategorySuccess({required this.response});
}

class UpdateSubCategoryFailure extends UpdateSubCategoryState {
  final String error;

  UpdateSubCategoryFailure({required this.error});
}
