import 'package:erp_system/features/scm/orders/inventory_order/data/models/get_all_inventory_orders_model.dart';

abstract class GetAllInventoryOrdersState {}

class GetAllInventoryOrdersInitial extends GetAllInventoryOrdersState {}

class GetAllInventoryOrdersLoading extends GetAllInventoryOrdersState {}

class GetAllInventoryOrdersFailure extends GetAllInventoryOrdersState {
  final String error;

  GetAllInventoryOrdersFailure({required this.error});
}

class GetAllInventoryOrdersSuccess extends GetAllInventoryOrdersState {
  final GetAllInventoryOrderModel response;

  GetAllInventoryOrdersSuccess({
    required this.response,
  });
}
