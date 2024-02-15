import 'package:erp_system/features/inventory/product/details_product/data/models/details_product_model.dart';

abstract class DetailsProductState {}

class DetailsProductInitial extends DetailsProductState {}

class DetailsProductLoading extends DetailsProductState {}

class DetailsProductFailure extends DetailsProductState {
  final String error;

  DetailsProductFailure({required this.error});
}

class DetailsProductSuccess extends DetailsProductState {
  final DetailsProductModel response;

  DetailsProductSuccess({
    required this.response,
  });
}
