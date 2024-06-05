import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/features/hr/department/update_department/data/models/UpdateDepartmentRequest.dart';
import 'package:erp_system/features/hr/department/update_department/data/repos/update_department_repo.dart';
import 'package:erp_system/features/hr/department/update_department/logic/update_department_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateDepartmentCubit extends Cubit<UpdateDepartmentState> {
  final UpdateDepartmentRepo _updateDepartmentRepo;

  UpdateDepartmentCubit(this._updateDepartmentRepo)
      : super(UpdateDepartmentInitial());

  TextEditingController departmentNameController =
      TextEditingController(text: departmentNameControllerInGetIt.toString());
  TextEditingController departmentDescriptionController =
      TextEditingController(text: departmentDescriptionInGetIt.toString());

  final formKey = GlobalKey<FormState>();

  void updateDepartment(int depId) async {
    emit(UpdateDepartmentLoading());
    final response = await _updateDepartmentRepo.updateDepartment(
        depId,
        UpdateDepartmentRequest(
            departmentName: departmentNameController.text,
            description: departmentDescriptionController.text));

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
