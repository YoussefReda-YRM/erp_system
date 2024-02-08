
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/features/inventory/category/data/CategoryDM.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  final List<CategoryDm> categories;


  CategorySuccess( this.categories);
}

class CategoryFailure extends CategoryState {
  final String error;

  CategoryFailure({required this.error});
}


class CategorySuccessDeletion extends CategoryState {


}
