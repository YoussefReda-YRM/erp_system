import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/features/accounting/get_all_scm_orders.dart/data/repos/get_all_scm_orders_repo.dart';
import 'package:erp_system/features/accounting/get_all_scm_orders.dart/logic/get_all_scm_orders_state.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllScmOrdersCubit extends Cubit<GetAllScmOrdersState> {
  final GetAllScmOrdersRepo _getAllScmOrdersRepo;
  GetAllScmOrdersCubit(this._getAllScmOrdersRepo)
      : super(GetAllScmOrdersInitial());
  Future<void> getAllScmOrders() async {
    emit(GetAllScmOrdersLoading());
    var response = await _getAllScmOrdersRepo.getAllScmOrders(
      getIt.get<LoginResponse>().token!,
    );
    response.when(
      success: (getAllScmOrders) {
        emit(GetAllScmOrdersSuccess(
          response: getAllScmOrders,
        ));
      },
      failure: (error) {
        emit(GetAllScmOrdersFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
