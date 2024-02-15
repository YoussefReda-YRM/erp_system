import 'package:erp_system/features/inventory/product/get_all_product/data/models/product_response.dart';

abstract class GetAllProductState {}

class GetAllProductInitial extends GetAllProductState {}

class GetAllProductLoading extends GetAllProductState {}

class GetAllProductFailure extends GetAllProductState {
  final String error;

  GetAllProductFailure({required this.error});
}

class GetAllProductSuccess extends GetAllProductState {
  final GetAllProductResponse response;

  GetAllProductSuccess({
    required this.response,
  });
}
