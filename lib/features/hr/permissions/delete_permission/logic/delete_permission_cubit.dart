import 'package:erp_system/features/hr/permissions/delete_permission/data/repos/delete_permission_repo.dart';
import 'package:erp_system/features/hr/permissions/delete_permission/logic/delete_permission_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeletePermissionCubit extends Cubit<DeletePermissionState> {
  final DeletePermissionRepo _deletePermissionRepo;

  DeletePermissionCubit(this._deletePermissionRepo) : super(DeletePermissionInitial());

  void deletePermission(String permissionId) async {
    emit(DeletePermissionLoading());

    final response = await _deletePermissionRepo.deletePermission(permissionId);

    response.when(
      success: (response) {
        emit(DeletePermissionSuccess(response));
      },
      failure: (error) {
        emit(GetAllPermissionFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }



}
