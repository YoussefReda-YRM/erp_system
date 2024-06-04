import 'package:erp_system/features/inventory/inventory_order/update_order/data/models/update_order_response.dart';

abstract class UpdateOrderState {}

class UpdateOrderInitial extends UpdateOrderState {}

class UpdateOrderLoading extends UpdateOrderState {}

class UpdateOrderSuccess extends UpdateOrderState {
  final UpdateOrderResponse response;

  UpdateOrderSuccess({required this.response});
}

class UpdateOrderFailure extends UpdateOrderState {
  final String error;

  UpdateOrderFailure({required this.error});
}
