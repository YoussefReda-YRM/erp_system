import 'package:erp_system/features/inventory/inventory_home/data/models/inventory_home_model.dart';

abstract class InventoryHomeState {}

class InventoryHomeInitial extends InventoryHomeState {}

class InventoryHomeLoading extends InventoryHomeState {}

class InventoryHomeFailure extends InventoryHomeState {
  final String error;

  InventoryHomeFailure({required this.error});
}

class InventoryHomeSuccess extends InventoryHomeState {
  final InventoryHomeModel response;

  InventoryHomeSuccess({
    required this.response,
  });
}
