import 'package:erp_system/features/inventory/category/repos/ResponseSubCategory.dart';

abstract class AddSubCategoryState {}

class AddSubCategoryInitial extends AddSubCategoryState {}

class AddSubCategoryLoading extends AddSubCategoryState {}

class AddSubCategorySuccess extends AddSubCategoryState {
  final ResponseSubCategory response;

  AddSubCategorySuccess({required this.response});
}

class AddSubCategoryFailure extends AddSubCategoryState {
  final String error;

  AddSubCategoryFailure({required this.error});
}
