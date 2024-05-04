import 'package:erp_system/features/hr/permissions/get_all_permissions/data/repos/get_all_permission_repo.dart';
import 'package:erp_system/features/hr/permissions/get_all_permissions/logic/get_all_permission_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllPermissionCubit extends Cubit<GetAllPermissionsState> {
  final GetAllPermissionRepo _allPermissionRepo;
  GetAllPermissionCubit(this._allPermissionRepo)
      : super(GetAllPermissionsInitial());
  Future<void> getAllPermissions() async {
    emit(GetAllPermissionsLoading());
    var response = await _allPermissionRepo.getAllPermissions();
    response.when(
      success: (getAllPermission) {
        emit(GetAllPermissionsSuccess(
          response: getAllPermission,
        ));
      },
      failure: (error) {
        emit(GetAllPermissionsFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
