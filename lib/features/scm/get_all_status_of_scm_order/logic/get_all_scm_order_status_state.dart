import 'package:erp_system/features/scm/get_all_status_of_scm_order/data/models/get_all_scm_order_status_Response.dart';

abstract class GetAllScmOrderStatusState {}

class GetAllScmOrderStatusInitial extends GetAllScmOrderStatusState {}

class GetAllScmOrderStatusLoading extends GetAllScmOrderStatusState {}

class GetAllScmOrderStatusFailure extends GetAllScmOrderStatusState {
  final String error;

  GetAllScmOrderStatusFailure({required this.error});
}

class GetAllScmOrderStatusSuccess extends GetAllScmOrderStatusState {
  final List<GetAllScmOrderStatusResponse> response;

  GetAllScmOrderStatusSuccess({
    required this.response,
  });
}
