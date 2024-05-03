import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/hr/permissions/update_status_of_permission/data/models/UpdateStatusOfPermissionRequest.dart';
import 'package:erp_system/features/hr/permissions/update_status_of_permission/data/repos/update_status_of_permission_repo.dart';
import 'package:erp_system/features/hr/permissions/update_status_of_permission/logic/update_status_of_permission_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateStatusOfPermissionCubit
    extends Cubit<UpdateStatusOfPermissionState> {
  final UpdateStatusOfPermissionRepo _updateStatusOfPermissionRepo;

  UpdateStatusOfPermissionCubit(this._updateStatusOfPermissionRepo)
      : super(UpdateStatusOfPermissionInitial());

  final formKey = GlobalKey<FormState>();

  void updatePermission(String permissionId, int status) async {
    emit(UpdateStatusOfPermissionLoading());
    final response =
        await _updateStatusOfPermissionRepo.updateStatusOfPermission(
      getIt.get<LoginResponse>().token!,
      permissionId,
      UpdateStatusOfPermissionRequest(
        status: status,
      ),
    );

    response.when(
      success: (response) {
        emit(UpdateStatusOfPermissionSuccess(response: response));
      },
      failure: (error) {
        emit(
          UpdateStatusOfPermissionFailure(
              error: error.apiErrorModel.message ?? ''),
        );
      },
    );
  }
}
