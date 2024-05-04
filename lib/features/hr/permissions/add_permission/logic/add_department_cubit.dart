import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/hr/department/add_department/data/models/AddDepartmentRequest.dart';
import 'package:erp_system/features/hr/department/add_department/data/repos/add_department_repo.dart';
import 'package:erp_system/features/hr/department/add_department/logic/add_department_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddDepartmentCubit extends Cubit<AddDepartmentState> {
  final AddDepartmentRepo _addDepartmentRepo;
  AddDepartmentCubit(this._addDepartmentRepo)
      : super(AddDepartmentInitial());

  TextEditingController departmentNameController = TextEditingController();
  TextEditingController departmentDescriptionController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void addDepartment() async {
    emit(AddDepartmentLoading());
    final response = await _addDepartmentRepo.addDepartment(AddDepartmentRequest(
      departmentName:departmentNameController.text,
      description: departmentDescriptionController.text,)
      ,
      getIt.get<LoginResponse>().token!,
    );


    response.when(
      success: (response) {
        print("kkkkkk");
        emit(AddDepartmentSuccess(response: response));
      },
      failure: (error) {
        emit(
          AddDepartmentFailure(error: error.apiErrorModel.message ?? ''),
        );
      },
    );
  }
}
