import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/scm/scm_home/data/repo/scm_home_repo.dart';
import 'package:erp_system/features/scm/scm_home/logic/scm_home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScmHomeCubit extends Cubit<ScmHomeState> {
  final ScmHomeRepo _scmHomeRepo;
  ScmHomeCubit(this._scmHomeRepo) : super(ScmHomeInitial());
  Future<void> getNumberOfInventoryAndScmOrders() async {
    emit(ScmHomeLoading());
    var response =
        await _scmHomeRepo.getNumberOfInventoryAndScmOrdersCount(
      getIt.get<LoginResponse>().token!,
    );
    response.when(
      success: (numbersOfInventoryAndScm) {
        emit(ScmHomeSuccess(
          response: numbersOfInventoryAndScm,
        ));
      },
      failure: (error) {
        emit(ScmHomeFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
