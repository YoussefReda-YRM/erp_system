import 'package:erp_system/features/accounting/get_all_scm_orders.dart/data/models/get_all_scm_orders_response.dart';

abstract class GetAllScmOrdersState {}

class GetAllScmOrdersInitial extends GetAllScmOrdersState {}

class GetAllScmOrdersLoading extends GetAllScmOrdersState {}

class GetAllScmOrdersFailure extends GetAllScmOrdersState {
  final String error;

  GetAllScmOrdersFailure({required this.error});
}

class GetAllScmOrdersSuccess extends GetAllScmOrdersState {
  final List<GetAllScmOrdersResponse> response;

  GetAllScmOrdersSuccess({
    required this.response,
  });
}
