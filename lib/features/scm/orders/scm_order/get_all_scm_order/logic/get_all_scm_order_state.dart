import 'package:erp_system/features/hr/job_position/get_all_job_position/data/models/GetAllJobPositionResponse.dart';
import 'package:erp_system/features/scm/orders/scm_order/get_all_scm_order/data/models/GetAllScmOrdersModel.dart';

abstract class GetAllScmOrderState {}

class GetAllScmOrderInitial extends GetAllScmOrderState {}

class GetAllScmOrderLoading extends GetAllScmOrderState {}

class GetAllScmOrderFailure extends GetAllScmOrderState {
  final String error;

  GetAllScmOrderFailure({required this.error});
}

class GetAllScmOrderSuccess extends GetAllScmOrderState {
  final List<GetAllScmOrdersModel> response;

  GetAllScmOrderSuccess({
    required this.response,
  });
}