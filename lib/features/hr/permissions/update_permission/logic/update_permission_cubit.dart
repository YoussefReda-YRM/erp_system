/*import 'package:erp_system/features/hr/permissions/update_permission/data/repos/update_permission_repo.dart';
import 'package:erp_system/features/hr/permissions/update_permission/logic/update_permission_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdatePermissionCubit extends Cubit<UpdatePermissionState> {
  final UpdatePermissionRepo _updatePermissionRepo;

  UpdatePermissionCubit(this._updatePermissionRepo)
      : super(UpdatePermissionInitial());

  TextEditingController startTimeController = TextEditingController(text: departmentNameControllerInGetIt.toString());
  TextEditingController endTimeController = TextEditingController(text: departmentDescriptionInGetIt.toString());

  final formKey = GlobalKey<FormState>();

  void updateDepartment(int depId) async {
    emit(UpdateDepartmentLoading());
    final response = await _updateDepartmentRepo.updateDepartment(getIt.get<LoginResponse>().token!, depId, UpdateDepartmentRequest(
        departmentName:departmentNameController.text,
        description: departmentDescriptionController.text

    ));

    response.when(
      success: (response) {
        emit(UpdateDepartmentSuccess(response: response));
      },
      failure: (error) {
        emit(
          UpdateDepartmentFailure(error: error.apiErrorModel.message ?? ''),
        );
      },
    );
  }
}
*/