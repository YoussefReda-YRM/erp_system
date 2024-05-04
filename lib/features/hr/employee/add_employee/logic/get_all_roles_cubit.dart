import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/features/hr/employee/add_employee/data/repos/get_all_roles_repo.dart';
import 'package:erp_system/features/hr/employee/add_employee/logic/get_all_roles_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllRolesCubit extends Cubit<GetAllRolesState> {
  final GetAllRolesRepo _getAllRolesRepo;
  GetAllRolesCubit(this._getAllRolesRepo)
      : super(GetAllRolesInitial());
  Future<void> getAllRoles() async {
    emit(GetAllRolesLoading());
    var response = await _getAllRolesRepo.getAllRoles();
    response.when(
      success: (getAllRoles) {
        getAllRolesGetIt = getAllRoles;
        emit(GetAllRolesSuccess(
          getAllRoles,
        ));
      },
      failure: (error) {
        emit(GetAllRolesFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
