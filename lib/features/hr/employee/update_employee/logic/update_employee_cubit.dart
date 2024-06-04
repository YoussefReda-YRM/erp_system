import 'package:erp_system/features/hr/employee/update_employee/data/models/update_employee_request.dart';
import 'package:erp_system/features/hr/employee/update_employee/data/repos/update_employee_repo.dart';
import 'package:erp_system/features/hr/employee/update_employee/logic/update_employee_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateEmployeeCubit extends Cubit<UpdateEmployeeState> {
  final UpdateEmployeeRepo _updateEmployeeRepo;

  UpdateEmployeeCubit(this._updateEmployeeRepo)
      : super(UpdateEmployeeInitial());

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  int? employeeDepartmentId;
  String? roleController;
  String? employeeJobController;
  TextEditingController addressController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController identificationNoController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController bankAccountController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController salaryController = TextEditingController();

  ValueNotifier<String> genderNotifier =
      ValueNotifier<String>(''); // Updated for gender

  final formKey = GlobalKey<FormState>();

  void updateEmployee(String employeeId) async {
    emit(UpdateEmployeeLoading());
    final response = await _updateEmployeeRepo.updateEmployee(
      employeeId,
      UpdateEmployeeRequest(
        address: addressController.text,
        bankAccount: bankAccountController.text,
        birthDate: birthDateController.text,
        confirmPassword: passwordConfirmationController.text,
        email: emailController.text,
        employeeDepartmentId: employeeDepartmentId!,
        employeeJob: employeeJobController,
        gender: genderNotifier.value.toString(),
        identificationNo: identificationNoController.text,
        name: nameController.text,
        nationality: nationalityController.text,
        password: passwordController.text,
        phoneNumber: "+20${phoneNumberController.text}",
        role: "HRAdmin", //roleController.text,
        salary: double.parse(salaryController.text),
        userName: userNameController.text,
      ),
    );

    response.when(
      success: (response) {
        emit(UpdateEmployeeSuccess());
      },
      failure: (error) {
        emit(
          UpdateEmployeeFailure(error: error.apiErrorModel.message ?? ''),
        );
      },
    );
  }

  void updateGender(String gender) {
    genderNotifier.value = gender;
  }
}
