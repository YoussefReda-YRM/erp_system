import 'package:erp_system/features/inventory/category/repos/ResponseParentCategory.dart';

abstract class UpdateParentCategoryState {}

class UpdateParentCategoryInitial extends UpdateParentCategoryState {}

class UpdateParentCategoryLoading extends UpdateParentCategoryState {}

class UpdateParentCategorySuccess extends UpdateParentCategoryState {
  final ResponseParentCategory response;

  UpdateParentCategorySuccess({required this.response});
}

class UpdateParentCategoryFailure extends UpdateParentCategoryState {
  final String error;

  UpdateParentCategoryFailure({required this.error});
}
