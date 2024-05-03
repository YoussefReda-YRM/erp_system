import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/hr/permissions/update_permission/data/models/UpdatePermissionRequest.dart';
import 'package:erp_system/features/hr/permissions/update_permission/data/repos/update_permission_repo.dart';
import 'package:erp_system/features/hr/permissions/update_permission/logic/update_permission_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdatePermissionCubit extends Cubit<UpdatePermissionState> {
  final UpdatePermissionRepo _updatePermissionRepo;

  UpdatePermissionCubit(this._updatePermissionRepo)
      : super(UpdatePermissionInitial());

  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void updatePermission(int permissionId) async {
    emit(UpdatePermissionLoading());
    final response = await _updatePermissionRepo.updatePermission(getIt.get<LoginResponse>().token!, permissionId, UpdatePermissionRequest(
      start: startTimeController.text,
      end:endTimeController.text,
      date: dateController.text,
      description:descriptionController.text
    ),)
    ;

    response.when(
      success: (response) {
        emit(UpdatePermissionSuccess(response: response));
      },
      failure: (error) {
        emit(
          UpdatePermissionFailure(error: error.apiErrorModel.message ?? ''),
        );
      },
    );
  }
}
