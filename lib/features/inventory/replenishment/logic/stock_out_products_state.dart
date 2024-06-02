import 'package:erp_system/features/inventory/replenishment/data/models/stock_out_products_response.dart';

abstract class StockOutProductstState {}

class StockOutProductsInitial extends StockOutProductstState {}

class StockOutProductsLoading extends StockOutProductstState {}

class StockOutProductsFailure extends StockOutProductstState {
  final String error;

  StockOutProductsFailure({required this.error});
}

class StockOutProductsSuccess extends StockOutProductstState {
  final List<StockOutProductsResponse> response;

  StockOutProductsSuccess({
    required this.response,
  });
}
