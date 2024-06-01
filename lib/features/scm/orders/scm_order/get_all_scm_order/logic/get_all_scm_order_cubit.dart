import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/hr/job_position/get_all_job_position/data/repos/get_all_job_position_repo.dart';
import 'package:erp_system/features/hr/job_position/get_all_job_position/logic/get_all_job_position_state.dart';
import 'package:erp_system/features/scm/orders/scm_order/get_all_scm_order/data/repos/get_all_scm_order_repo.dart';
import 'package:erp_system/features/scm/orders/scm_order/get_all_scm_order/logic/get_all_scm_order_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllScmOrderCubit extends Cubit<GetAllScmOrderState> {
  final GetAllScmOrderRepo _getAllScmOrderRepo;
  GetAllScmOrderCubit(this._getAllScmOrderRepo)
      : super(GetAllScmOrderInitial());
  Future<void> getAllScmOrder() async {
    emit(GetAllScmOrderLoading());
    var response = await _getAllScmOrderRepo.getAllScmOrder( getIt.get<LoginResponse>().token!,);
    response.when(
      success: (scmOrder) {
        scmOrderModelInGetIt = scmOrder;
        emit(GetAllScmOrderSuccess(response: scmOrder));
      },
      failure: (error) {
        emit(GetAllScmOrderFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
