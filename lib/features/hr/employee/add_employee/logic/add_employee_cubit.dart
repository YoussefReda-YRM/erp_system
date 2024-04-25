import 'package:erp_system/features/hr/employee/add_employee/data/models/add_employee_body.dart';
import 'package:erp_system/features/hr/employee/add_employee/data/repos/Add_employee_repo.dart';
import 'package:erp_system/features/hr/employee/add_employee/logic/add_employee_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEmployeeCubit extends Cubit<AddEmployeeState> {
  final AddEmployeeRepo _addEmployeeRepo;

  AddEmployeeCubit(this._addEmployeeRepo) : super(AddEmployeeInitial());

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  TextEditingController employeeJobController = TextEditingController();
  int? employeeDepartmentId;
  String? roleController;
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

  void addEmployee() async {
    emit(AddEmployeeLoading());
    final response = await _addEmployeeRepo.addEmployee(
      AddEmployeeRequestBody(
        address: addressController.text,
        bankAccount: bankAccountController.text,
        birthDate: birthDateController.text,
        confirmPassword: passwordConfirmationController.text,
        email: emailController.text,
        employeeDepartmentId: employeeDepartmentId!,
        employeeJob: employeeJobController.text,
        gender: genderNotifier.value.toString(),
        identificationNo: identificationNoController.text,
        name: nameController.text,
        nationality: nationalityController.text,
        password: passwordController.text,
        phoneNumber: "+20${phoneNumberController.text}",
        role: roleController!,
        salary: double.parse(salaryController.text),
        userName: userNameController.text,
      ),
    );
    response.when(
      success: (loginResponse) {
        emit(AddEmployeeSuccess(loginResponse));
      },
      failure: (error) {
        emit(AddEmployeeFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }

  void updateGender(String gender) {
    genderNotifier.value = gender;
  }

}
