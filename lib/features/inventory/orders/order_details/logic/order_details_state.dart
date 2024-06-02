import 'package:erp_system/features/inventory/orders/order_details/data/models/order_details_model.dart';

abstract class OrderDetailsState {}

class OrderDetailsInitial extends OrderDetailsState {}

class OrderDetailsLoading extends OrderDetailsState {}

class OrderDetailsFailure extends OrderDetailsState {
  final String error;

  OrderDetailsFailure({required this.error});
}

class OrderDetailsSuccess extends OrderDetailsState {
  final OrderDetailsModel response;

  OrderDetailsSuccess({
    required this.response,
  });
}
