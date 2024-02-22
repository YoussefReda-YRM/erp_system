import 'package:erp_system/features/inventory/category/repos/ResponseParentCategory.dart';

abstract class AddParentCategoryState {}

class AddParentCategoryInitial extends AddParentCategoryState {}

class AddParentCategoryLoading extends AddParentCategoryState {}

class AddParentCategorySuccess extends AddParentCategoryState {
  final ResponseParentCategory response;

  AddParentCategorySuccess({required this.response});
}

class AddParentCategoryFailure extends AddParentCategoryState {
  final String error;

  AddParentCategoryFailure({required this.error});
}
