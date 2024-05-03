import 'package:erp_system/features/hr/permissions/Permissions_of_specific_employee/data/repos/get_permission_of_specific_employee_repo.dart';
import 'package:erp_system/features/hr/permissions/Permissions_of_specific_employee/logic/get_permission_of_specific_employee_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetPermissionOfSpecificEmployeeCubit extends Cubit<GetPermissionsOfSpecificEmployeeState> {
  final GetPermissionOfSpecificEmployeeRepo _getPermissionOfSpecificEmployeeRepo;
  GetPermissionOfSpecificEmployeeCubit(this._getPermissionOfSpecificEmployeeRepo)
      : super(GetPermissionsOfSpecificEmployeeInitial());
  Future<void> getPermissionsOfSpecificEmployee() async {
    emit(GetPermissionsOfSpecificEmployeeLoading());
    var response = await _getPermissionOfSpecificEmployeeRepo.getPermissionsOfSpecificEmployee();
    response.when(
      success: (getPermissionsOfSpecificEmployee) {
        emit(GetPermissionsOfSpecificEmployeeSuccess(
          response: getPermissionsOfSpecificEmployee,
        ));
      },
      failure: (error) {
        emit(GetPermissionsOfSpecificEmployeeFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
