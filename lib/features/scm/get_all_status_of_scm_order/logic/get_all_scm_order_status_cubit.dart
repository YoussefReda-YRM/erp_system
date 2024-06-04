import 'package:erp_system/features/scm/get_all_status_of_scm_order/data/repos/get_all_scm_order_status_repo.dart';
import 'package:erp_system/features/scm/get_all_status_of_scm_order/logic/get_all_scm_order_status_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllScmOrderStatusCubit extends Cubit<GetAllScmOrderStatusState> {
  final GetAllScmOrderStatusRepo _getAllScmOrderStatusRepo;
  GetAllScmOrderStatusCubit(this._getAllScmOrderStatusRepo)
      : super(GetAllScmOrderStatusInitial());
  Future<void> getAllScmOrderStatus() async {
    emit(GetAllScmOrderStatusLoading());
    var response = await _getAllScmOrderStatusRepo.getAllScmOrderStatus();
    response.when(
      success: (getAllScmOrderStatus) {
        emit(GetAllScmOrderStatusSuccess(
          response: getAllScmOrderStatus,
        ));
      },
      failure: (error) {
        emit(GetAllScmOrderStatusFailure(
            error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
