import 'package:erp_system/features/inventory/product/update_product/data/models/update_product_response.dart';

abstract class UpdateProductState {}

class UpdateProductInitial extends UpdateProductState {}

class UpdateProductLoading extends UpdateProductState {}

class UpdateProductSuccess extends UpdateProductState {
  final UpdateProductResponse updateProductResponse;

  UpdateProductSuccess(this.updateProductResponse);
}

class UpdateProductFailure extends UpdateProductState {
  final String error;

  UpdateProductFailure({required this.error});
}
