import 'package:erp_system/features/scm/orders/scm_order/add_scm_order/data/models/AddScmOrderResponse.dart';

abstract class AddScmOrderState {}

class AddScmOrderInitial extends AddScmOrderState {}

class AddScmOrderLoading extends AddScmOrderState {}

class AddScmOrderFailure extends AddScmOrderState {
  final String error;

  AddScmOrderFailure({required this.error});
}

class AddScmOrderSuccess extends AddScmOrderState {
  final AddScmOrderResponse response;

  AddScmOrderSuccess({
    required this.response,
  });
}
