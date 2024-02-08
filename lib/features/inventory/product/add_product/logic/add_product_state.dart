import 'package:erp_system/features/inventory/product/add_product/data/models/add_product_response.dart';

abstract class AddProductState {}

class AddProductInitial extends AddProductState {}

class AddProductLoading extends AddProductState {}

class AddProductSuccess extends AddProductState {
  final AddProductResponse addProductResponse;

  AddProductSuccess(this.addProductResponse);
}

class AddProductFailure extends AddProductState {
  final String error;

  AddProductFailure({required this.error});
}